class ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

end
