class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
  end

  def edit
  end

  def create
    @question = Question.find_by_title(question_params[:title])
    if @question
      flash[:notice] = "duplicate questions，forwarding"
      redirect_to question_path(@question.id)
      return
    end
    @question = Question.new(question_params)
    @question.user_id = current_user.id

    respond_to do |format|
      if @ask.save
        format.html { redirect_to(question_path(@question.id), :notice => 'Question is created.') }
        format.json
      else
        format.html { render :action => "new" }
        format.json
      end
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body, :topics)
  end
end
