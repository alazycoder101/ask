class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def show
  end

  def index
    @users = User.order(:login).page params[:page]
  end

  def follow
    current_user.follow(@user)
  end

  def unfollow
    current_user.unfollow(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
