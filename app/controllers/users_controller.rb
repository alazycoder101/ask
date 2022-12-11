class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def show
  end

  def index
    @users = User.order(:login).page params[:page]
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
