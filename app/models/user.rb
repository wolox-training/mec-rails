class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates :email, presence: true
  validates :encrypted_password, presence: true, uniqueness: { case_sensitive: false }
  has_many :rents, dependent: :destroy
  has_many :books, through: :rents
end
