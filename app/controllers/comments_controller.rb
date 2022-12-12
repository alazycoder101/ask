class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(question_path(@comment.commentable_id), :notice => 'Comment is created.') }
        format.json
      else
        redirect_back(fallback_location: question_path(@comment.commentable_id),  alert: @comment.errors.full_messages.join(', '))
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commentable_id, :commentable_type)
  end
end
