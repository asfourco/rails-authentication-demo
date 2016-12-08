class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true, length: { in: 8..20 }
  validates :email, uniqueness: true, presence: true

  # Password encryption
  attr_accessor :password
  validates :password, confirmation: true #password_confirmation attr
  validates_length_of :password, in: 8..20

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end
