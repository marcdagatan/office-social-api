class PostPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    author?
  end

  def destroy?
    author?
  end

  private

  def author?
    user == record.author
  end
end
