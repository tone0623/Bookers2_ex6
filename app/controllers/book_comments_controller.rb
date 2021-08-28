class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    #@comment = current_user.book_comments.new(comment_params)
    @comment = BookComment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = params[:book_id]
    @comment.save
    # 非同期通信
    render :create
  end

  def destroy
    @comment = BookComment.find(params[:id])
    @comment.destroy
    # 非同期通信
    render :destroy
  end

  private
  
  def comment_params
    params.require(:book_comment).permit(:body)
  end
end
