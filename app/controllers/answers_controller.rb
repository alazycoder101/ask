class AnswersController < ApplicationController
  before_action :authenticate_user!

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
    answer = Answer.find(params[:id])
    vote_type = :down
    if params[:inc] == "1"
      vote_type = :up
    end
    success = answer.vote(:voter_id => current_user.id, :value => vote_type)

    answer.reload
    render :text => "#{answer.up_votes_count}|#{answer.down_votes_count}"
  end

  def delete
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
