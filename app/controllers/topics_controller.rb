class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
  end
  
  def new
    @topic = Topic.new
    # @comments = @topic.comments
    # @comment = Comment.new
  end
  # 8,9行名は正しいのか "https://qiita.com/nojinoji/items/2034764897c6e91ef982" を参照20191103、、、

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
  
end