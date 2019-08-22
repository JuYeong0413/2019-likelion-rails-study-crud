class Post < ApplicationRecord
	mount_uploader :image, ImageUploader

	def self.delete_message
		"삭제한 글은 복구할 수 없습니다."
	end

	def increase_view_count
		self.view_count = view_count + 1
		self.save

	end

	belongs_to :user
	has_many :comments, dependent: :destroy

	has_many :likes, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user # likes를 통해서 liked_users(우리가 지정해준 이름)를 가져올 것임, through랑 source는 명확히 해야 함
	# likes는 위에 정의되어 있으니까 쓸 수 있는 것이고 user도 belongs_to가 있어서 쓸 수 있는 거다
end
