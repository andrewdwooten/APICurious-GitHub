class FollowActivityController < ApplicationController
  before_action :authorize!

  def show
    @follow_activity = current_user.follow_activity
  end
end
