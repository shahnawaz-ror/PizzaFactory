class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.vendor?
      can :update, Inventory
      can :create, Pizza
      can :home, Order
    elsif user.customer?
      can :create, Order
      can :read, Pizza
      can :home, Order
    end
  end
end
