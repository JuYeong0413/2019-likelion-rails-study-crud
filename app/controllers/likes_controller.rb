class LikesController < ApplicationController
  before_action :authenticate_user!

  def like_toggle

    post = Post.find(params[:post_id])
    like = post.likes.find_by(user: current_user)
    # like = Like.find_by(user: current_user, post:)
    # where는 activerecord relation {<obj1> <obj2>} 으로 묶여서 온다
    # find_by는 조건에 만족하는 오브젝트 중에서 하나의 객체만 나옴(박스에 담겨있지 않음), 조건에 만족하는 객체가 없으면 nil

    if like.nil?
      post.likes.create!(user: current_user)
      # Like.create(user: current_user, post:post)
      @result = 'heart'
    else
      like.destroy
      @result = 'heart-empty'
    end

    @count = post.likes.count

    # redirect_back(fallback_location: root_path)
    # render :json => result
    # render :js
    # 안 써줘도 remote: true이기 때문에 자동으로 렌더링 됨 대신 골뱅이 붙여줘야 함

  end
end
