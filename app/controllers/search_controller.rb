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

  def all
    if params[:q].present?
      @items = PgSearch.multisearch(params[:q])
      render "/search/all"
    else
      @questions = Question.order(id: :desc).page params[:page]
      render "/questions/index"
    end
  end
end
