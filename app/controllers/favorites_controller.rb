class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    favorite.save
      redirect_to topics_path, success: 'いいねしました'
        # redirect_to topics_path, danger: 'Favorite registration failed'
  end

  def destroy
    @favorite = Favorite.find_by(
      user_id: current_user.id,
      topic_id: params[:topic_id]
    )
    @favorite.destroy
      redirect_to topics_path
      # flash.now[:danger] = 'いいねを取り消しました'
      # ("/topics/#{params[:topic_id]}")
  end
end
