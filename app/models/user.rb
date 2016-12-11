class User < ApplicationRecord
  before_create :confirmation_token

  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false, message: 'User already registered' }, presence: true
  # TODO: Validate email by sending an actual email to the user

  validate :password_complexity

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!
  end

  def reset_token
    self.reset_password_token = SecureRandom.urlsafe_base64.to_s
    self.reset_password_token_expires_at = DateTime.now.advance(days: 1)
    save
  end

  def deactivate_reset_password
    self.reset_password_token = nil
    self.reset_password_token_expires_at = nil
    self.save
  end

  private

    def password_complexity
      if password.present? && !password.match(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/)
        errors.add :password, 'must include at least one lowercase letter, one uppercase letter, and one digit'
      end
    end
end
