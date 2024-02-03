class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, Recipe, public: true
    nil unless user.present?
  end
end
