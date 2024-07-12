class TopicsController < ApplicationController

  before_action :set_topic, only: [:show, :follow]

  def index
    @topics = Topic.order(:name).page params[:page]
  end

  def show
    authorize @topic
  end


  def follow
    current_user.follow(@topic)
  end

  def unfollow
    current_user.unfollow(@topic)
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
