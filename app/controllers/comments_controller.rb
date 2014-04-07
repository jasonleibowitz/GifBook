class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @bookmark = Bookmark.find(params[:id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to @comment
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to @comment
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to current_user
  end

  private
  def comment_params
    return params.require(:comment).permit(:bookmark_id, :user_id, :content)
  end

end
