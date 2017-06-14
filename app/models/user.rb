class User < ActiveRecord::Base

  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
             format: {with: VALID_EMAIL_REGEX}, 
             uniqueness: true

  has_secure_password

  validates :password, presence: true, length: { in: 6..20 }, allow_nil: true
  validates :password_confirmation, presence: true

  has_many :statuses, :dependent => :destroy
  has_many :likes, :dependent => :destroy


end
