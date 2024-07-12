class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:update, :vote]

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id

    respond_to do |format|
      if @answer.save
        format.html { redirect_to(question_path(@answer.question_id), :notice => 'Answer is created.') }
        format.json
      else
        flash.alert = @answer.errors.full_messages.join('. ')
        format.html { render :action => "new" }
        format.json
      end
    end
  end

  def vote
    if params[:val].to_i == 1
      current_user.likes(answer)
    else
      current_user.dislikes(answer)
    end

    answer.reload
    render :text => "#{answer.up_votes_count}|#{answer.down_votes_count}"
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer
    @answer
  end

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
