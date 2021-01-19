class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :nickname, presence: true
  # validates :email, presence: true, uniqueness: true, 
  #           format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
            

  # validates :password, presence: true, length: { minimum: 7 },
  #           format: { with: }

end
