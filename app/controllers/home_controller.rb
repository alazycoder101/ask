class HomeController < ApplicationController
  def index
    @questions = Question.favored.page params[:page]
    @users = User.order(id: :desc).limit(5)
    @topics = Topic.order(id: :desc).limit(5)
  end
end
