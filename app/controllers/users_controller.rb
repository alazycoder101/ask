class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :toggle_follow, :follow, :unfollow]

  def edit; end

  def show; end

  def update
    authorize @user

    @user.update(user_params)
    redirect_to @user
  end

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

  def user_params
    params.require(:user).permit(:email, :login, :name)
  end
end
