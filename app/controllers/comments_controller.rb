class CommentsController < ApplicationController
  def index
    @comments_topics = current_user.comments_topics
  end

  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
    if !current_user.nil?
      @login_comment_id = current_user.id
    end
    @topic = Topic.find_by(id: params[:topic_id])
    @favorites_count = Favorite.where(topic_id: params[:topic_id]).count
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      redirect_to "/comments/new?topic_id=" + params[:comment][:topic_id], danger: "コメントに失敗しました"
    end
  end
  #   @comment = current_user.comments.new(comment_params)
  #   # Comment.new(comment_params)
  #   if @comment.save
  #    redirect_to topics_path, success: 'Comment completed'
  #   else
  #     # redirect_to topics_path, danger: 'Posting comment failed'
  #     flash.now[:danger] = 'Posting comment failed'
  #     render :new
  #   end
  # end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :topic_id, :description)
  end
end
