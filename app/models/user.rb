class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :birth_date, presence: true
  validates :family_name_ruby, :first_name_ruby, presence: true,
            format: { with: /\A[\p{katakana}]+\z/ }

  validates :email, presence: true, uniqueness: true, 
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
            
  validates :password, presence: true, length: { minimum: 6 },
            format: { with: /\A^(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}$\z/i }
  
  has_many :items
  has_many :orders
end
