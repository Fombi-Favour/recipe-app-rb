class Ability
  include CanCan::Ability
  def initialize(user); 
   can :read, Recipe, public: true
   return unless user.present?
  end
end
