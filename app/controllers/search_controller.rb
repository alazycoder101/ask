# coding: utf-8
class SearchController < ApplicationController

  def index
    if params[:q].present?
      @questions = Question.global_search(params[:q]).page params[:page]
    else
      @questions = Question.order(id: :desc).page params[:page]
    end
    render "/questions/index"
  end
end
