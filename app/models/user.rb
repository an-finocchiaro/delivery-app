class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :admin]

  validates :email, format: {with: /\A[\w+\-.]+@sistemadefrete\.com/}
end
