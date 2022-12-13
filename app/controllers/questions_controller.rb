class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_question, only: [:show, :update, :destroy, :edit, :vote, :toggle_follow, :follow, :unfollow, :upvote, :downvote]

  def index
    @questions = Question.order(views_count: :desc, answers_count: :desc).page params[:page]
  end

  def new
    @question = Question.new
  end

  def show
    @question.view!
  end

  def update
    authorize @question

    @question.update(question_params)
    redirect_to @question
  end

  def destroy
    authorize @question

    @question.destroy
    render plain: "OK"
  end

  def vote
    if params[:val].to_i == 1
      current_user.likes(@question)
    else
      current_user.dislikes(@question)
    end

    render :text => "#{@question.up_votes_count}|#{@question.down_votes_count}"
  end

  def upvote
    current_user.likes(@question)

    render plain: "voted", status: :created
  end

  def downvote
    current_user.dislikes(@question)

    render plain: "voted", status: :created
  end

  def toggle_follow
    if params[:val].to_i == 1
      current_user.follow(@question)
    else
      current_user.unfollow(@question)
    end

    render plain: "OK"
  end

  def follow
    current_user.follow(@question)

    render plain: "followed", status: :created
  end

  def unfollow
    current_user.unfollow(@question)

    render plain: "unfollowed", status: :created
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
      if @question.save
        format.html { redirect_to(question_path(@question.id), :notice => 'Question is created.') }
        format.json
      else
        flash.alert = @question.errors.full_messages.join('. ')
        format.html { render :action => "new" }
        format.json
      end
    end
  end

  def anwser
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body, :topic_ids)
  end
end
