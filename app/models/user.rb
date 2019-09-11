class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :nullify

  # enum role: [:admin, :normal]

  has_many :likes, dependent: :destroy
	has_many :liked_posts, through: :likes, source: :post # post 자동으로 가져와줌

end
