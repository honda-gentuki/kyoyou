class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_post, only: [:show, :edit, :update]
  before_action :set_post_form, only: [:create, :update]

  def index
    @users = User.all
    @posts = Post.all.order('created_at DESC').page(params[:page])
  end

  def new
    @post_form = PostForm.new
    @posts = Post.all
  end

  def create
    if @post_form.valid?
      @post_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @posts = Post.where(user_id: current_user.id).where.not(image: nil)
    @comments = @post.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    redirect_to action: :index unless @post.user_id == current_user.id
    post_attributes = @post.attributes
    @post_form = PostForm.new(post_attributes)
  end

  def update
    @post_form.images ||= @post.images.blobs
    if @post_form.valid?
      @post_form.update(post_form_params, @post)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def search
    redirect_to root_path if params[:search] == ''
    @users = User.all
    @posts = Post.all.order('created_at DESC').page(params[:page])
    if params[:search].present?
      @posts = @posts.where(
        'school_list LIKE ? OR course LIKE ? OR unit LIKE ? OR introduction LIKE ? OR development LIKE ? OR summary LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%"
      )
    end
  end

  private

  def post_form_params
    params.require(:post_form).permit(:school_list, :subject, :course, :unit, :introduction, :introduction_time, :development,
                                      :development_time, :summary, :summary_time, { images: [] }).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_post_form
    @post_form = PostForm.new(post_form_params)
  end
end
