class FollowActivityController < ApplicationController

  def show
    @follow_activity = current_user.follow_activity
  end
end
