class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(published: true).or(scope.where(user_id: @user.try(:id)))
    end
  end

  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end
  
  def new?
    @user == wiki.user  
  end
  
  def create?
    @user == wiki.user
  end
  
  def show?
    user.present?
  end

  def update?   
    user.present?
  end
  
  # def admin_list?
  #   user.admin?
  # end
  
  def destroy?
    @wiki.user || @user.admin?
  end
  
  # def publish
  #   @wiki = Wiki.find(params[:id])
  #   authorize @wiki, :update?
  #   @wiki.publish!
  #   redirect_to @wiki
  # end
  
end