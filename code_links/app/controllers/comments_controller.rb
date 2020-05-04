class CommentsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  def create
    @currentC = {}
    @currentC[current_user.name] = current_user.id
		@post = Post.find(params[:post_id])
	 	@comment = @post.comments.create(params[:comment].permit(:name, :body, :user_id))
		redirect_to post_path(@post)
	end

  def show
    @post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
  end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end
end
