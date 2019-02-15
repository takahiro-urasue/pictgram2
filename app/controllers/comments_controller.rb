class CommentsController < ApplicationController


  def index
    @comments_topics = current_user.comments_topics
  end

  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
    @login_comment_id = current_user.id
  end

  def create
    
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      flash.now[:danger] = 'コメントの登録に失敗しました'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :topic_id, :description)
  end

end
