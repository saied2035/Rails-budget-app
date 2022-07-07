# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :splash_screen, Catagory
    return unless user.present?
    can :manage, Catagory, author:user
    can :manage, Payment, author:user
  end
end
