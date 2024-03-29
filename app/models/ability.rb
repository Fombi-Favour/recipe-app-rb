class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, Recipe, public: true
    nil unless user.present?

    can :manage, Recipe, user_id: user.id
  end
end
