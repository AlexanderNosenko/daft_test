class UserPolicy < BasePolicy

  def permitted_attributes
    [
      :id,
      :name,
      :email,
      :reset_password_token,
      :date_of_birth,
      :created_at,
      :updated_at
    ]
  end

  def index?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    true
  end

  def destroy?
    update?
  end

  class Scope < Scope

    def resolve
      scope.all
    end

  end

end
