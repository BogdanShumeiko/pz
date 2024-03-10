# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.role == "realtor"
      can :edit, Premise
	  can :read, Premise
    elsif user.role == "renter"
      can :trade, Premise
	  can :read, Premise
    end
  end
end
