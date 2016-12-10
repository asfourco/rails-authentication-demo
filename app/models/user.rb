class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { in: 8..20 }
  validate :password_complexity
  
  def password_complexity
    if password.present? && !password.match(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+\z/)
      errors.add :password, 'must include at least one lowercase letter, one uppercase letter, and one digit'
    end
  end
  
  
end
