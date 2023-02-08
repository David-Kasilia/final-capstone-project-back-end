# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    case user.role
    when 'admin'
      can :manage, :all
    when 'moderator'
      can :manage, [Car, Reservation]
    when 'user'
      can :read, :all
      can :create, [Reservation]
      can :update, [Reservation], user_id: user.id
    else
      can :read, [Car]
    end
  end
  end
end
