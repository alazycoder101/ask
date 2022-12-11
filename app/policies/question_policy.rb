# frozen_string_literal: true

class QuestionPolicy < ApplicationPolicy
  def show?
    true
  end

  def update?
    user && record.user_id == user.id
  end

  def create?
    !user.nil?
  end

  def destroy?
    update?
  end
end
