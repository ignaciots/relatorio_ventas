class Ability
    include CanCan::Ability

    def initialize(user)
        if user.administrador?
            can :manage, :all
        elsif user.vendedor?
            can :read, [Property, Store, Sale, Category]
            can :create, Sale
            can :update, Sale do |sale|
                sale.try(:user) == user
            end
            can :destroy, Sale do |sale|
                sale.try(:user) == user
            end
        elsif user.supervisor?
            can :read, [Property, Store, Sale, Category]
            can :create, Sale
            can :update, Sale
            can :destroy, Sale
        end
      end
end
