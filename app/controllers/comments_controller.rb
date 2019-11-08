class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
    @comment.user_id = current_user.id
  end 

  def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to topics_path, success: "投稿に成功しました"
    else
      flash.now[:danger] ="投稿に失敗しました"
      render :new
    end 
  end 
  
  private
  def comment_params
    params.require(:comment).permit(:user_id, :topic_id, :comment)
  end
end