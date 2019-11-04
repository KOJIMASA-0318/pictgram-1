class CommentsController < ApplicationController
  
  def new
    
  end
  
  def create
    @comment_comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      redirect_to topics_path, success: "投稿に成功しました"
    else
      redirect_to topics_path, danger: "投稿に失敗しました"
    end
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
