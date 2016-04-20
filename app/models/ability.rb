class Ability
  include CanCan::Ability

  def initialize(user)
      if user.admin?
        can :manage, :all
      elsif user.seller?
        can :read, [Sale, Category]
        can :create, Sale
        can :update, Sale do |sale|
          sale.try(:user) == user
        end
        can :destroy, Sale do |sale|
          sale.try(:user) == user
        end
      elsif user.regular?
        can :read, Sale
      end
    end
end
