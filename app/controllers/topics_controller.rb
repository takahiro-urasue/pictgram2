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
      redirect_to topics_path, success: '投稿しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  # def create
  #   redirect_to("/topics/index")
  # end

  def edit
    @topic = Topic.find_by(id: params[:id])
    if @topic.checkbox == "true"
      @topic.checkbox = true
    end
  end

  def update
    @topic = Topic.find_by(id: params[:id])
    @topic.update topic_params
    @topic.description = params[:topic][:description]
    # @topic.textbox = params[:topic][:textbox]
    # @topic.pulldown = params[:topic][:pulldown]
    # @topic.checkbox = params[:topic][:checkbox] ? "true" : "false"
    # @topic.radiobutton = params[:topic][:radiobutton]
    if @topic.save
      redirect_to topics_path, success: '投稿を編集しました'
    else
      flash.now[:danger] = "descriptionを入力して下さい"
      render("topics/edit")
    end
  end

  def destroy
    @topic = Topic.find_by(id: params[:id])
    @topic.destroy
    redirect_to("/topics/index")
  end



  private
  def topic_params
    params.require(:topic).permit(:image, :description, :textbox, :pulldown, :radiobutton, :checkbox)
  end
end
