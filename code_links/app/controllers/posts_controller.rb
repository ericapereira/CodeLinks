class PostsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      @posts = Post.all
    else
      redirect_to login_path
    end
  end

  def new
    @current = {}
    @current[current_user.name] = current_user.id
    if logged_in?
      @post = Post.new
    else
      redirect_to login_path
    end
  end

  def create
    @current = {}
    @current[current_user.name] = current_user.id

    if logged_in?
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post
      else
        render 'new'
      end
    else
      redirect_to login_path
    end
  end

  def show
    @currentC = {}
    @currentC[current_user.name] = current_user.id
    @current = {}
    @current[current_user.name] = current_user.id


    if logged_in?
      @post = Post.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def update
    @current = {}
    @current[current_user.name] = current_user.id
    if logged_in?
      @post = Post.find(params[:id])

      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
    else
      redirect_to login_path
    end
  end

  def edit
    @current = {}
    @current[current_user.name] = current_user.id

    if logged_in?

      @post = Post.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def destroy
    if logged_in?

      @post = Post.find(params[:id])
      @post.destroy

      redirect_to posts_path
    else
      redirect_to login_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :context, :user_id)
  end
end
