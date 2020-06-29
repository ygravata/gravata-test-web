class SalePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def show?
    true
  end
  
  def create?
    true
  end

  def destroy?
    true
  end

  private

  def user_is_owner?
    record.user == user
  end  
end
