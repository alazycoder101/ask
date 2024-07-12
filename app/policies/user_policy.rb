# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def update?
    user && record.id == user.id
  end

  def create?
    !user.nil?
  end

  def destroy?
    update?
  end
end
