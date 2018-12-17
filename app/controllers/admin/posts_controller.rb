class Admin::PostsController < ApplicationController
  before_action:authenticate_user!
  before_action:find_post, only: [:edit, :update, :destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order('title ASC')

    if params[:status] == 'draft'
      @posts = Post.includes(:category).draft.order('title ASC')
      @active1 = 'active'
    elsif params[:status] == 'confidential'
      @posts = Post.includes(:category).confidential.order('title ASC')
      @active2 = 'active'
    else
      @posts = Post.includes(:category).published.order('title ASC')
      @active3 = 'active'
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Your post was successfully created'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def update
    @post.update(post_params)
    if @post.save
      flash[:warning] = 'The post was successfully updated'
      redirect_to admin_posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:danger] = 'The post was successfully deleted'
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title,
                                 :context,
                                 :category,
                                 :status,
                                 :image,
                                 :category_name,
                                 :user_id,
                                 :score
                                ).merge(user_id: current_user.id)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
