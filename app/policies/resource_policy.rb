# frozen_string_literal: true

class ResourcePolicy < ApplicationPolicy
  def show?
    true
  end

  # only owner can change
  def update?
    user && record.user_id == user.id
  end

  def create?
    !user.nil?
  end

  # same as update
  def destroy?
    update?
  end
end
