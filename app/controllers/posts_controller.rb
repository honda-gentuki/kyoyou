class PostsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_index, except: [:index, :show, :edit]

  def index
    @users = User.all
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post_form = PostForm.new
    @posts = Post.all
  end

  def create
    @post_form = PostForm.new(post_form_params)
    if @post_form.valid?
      @post_form.save
      redirect_to root_path
    else
      render :new
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
end
