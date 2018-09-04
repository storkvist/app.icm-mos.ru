class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.blank?

    can :read, Kit

    case user.permission
    when 'update_kits'
      can :manage, Kit
    when 'manage_all'
      can :manage, Category
      can :manage, Kit
      can :manage, Scale
      can :manage, User
    end
  end
end
