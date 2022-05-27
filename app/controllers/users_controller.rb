class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :likes, :following, :followers]

  def show
    @post = Post.where(user_id: current_user.id).includes(:user).order('created_at DESC')
    @follower_users = @user.followers
    @following_users = @user.following
  end

  def following
    @users = @user.following
    render 'follows'
  end

  def followers
    @users = @user.followers
    render 'followers'
  end

  def create
    @user = User.find(params[:following_id])
    current_user.follow(@user)
    @user.create_notification_follow!(current_user)
  end

  def likes
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end
end
