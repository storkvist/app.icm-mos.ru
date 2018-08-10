class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.blank?

    can :manage, Category
    can :manage, Kit
    can :manage, Scale
  end
end
