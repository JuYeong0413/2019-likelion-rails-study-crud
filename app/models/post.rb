class Post < ApplicationRecord

    def self.delete_message
        "삭제한 글은 복구할 수 없습니다."
    end

    def increase_view_count
        self.view_count = view_count + 1
        self.save

    has_many :comments, dependent: :destroy
    end
    
end
