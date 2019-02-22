class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users,:comments)
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    @favorites_count = Favorite.where(topic_id: @topic.id).count
  end

  def new
    @topic = Topic.new
  end

  def create

    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: 'Successful submission'
    else
      flash.now[:danger] = "Posting failed"
      render :new
    end
  end

  # def create
  #   redirect_to("/topics/index")
  # end

  def edit
    @topic = Topic.find_by(id: params[:id])
  end

  def update
    @topic = Topic.find_by(id: params[:id])
    @topic.description = params[:topic][:description]
    @topic.save
    redirect_to("/topics/index")
  end

  def destroy
    @topic = Topic.find_by(id: params[:id])
    @topic.destroy
    redirect_to("/topics/index")
  end



  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
