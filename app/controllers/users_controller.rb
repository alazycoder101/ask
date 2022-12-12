class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :toggle_follow, :follow, :unfollow]

  def show; end

  def index
    @users = User.order(:login).page params[:page]
  end

  def toggle_follow
    if params[:val].to_i == 1
      current_user.follow(@user)
    else
      current_user.unfollow(@user)
    end

    render plain: "OK"
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
