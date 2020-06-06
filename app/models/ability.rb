# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.blank?
    if user&.is_admin
      can :manage, :all
    else
      can [:read, :create], Tweet
      can %i[update destroy], Tweet, tweet_by: user.id
    end
  end
end
