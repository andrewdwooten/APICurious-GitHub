class DashboardController < ApplicationController
  before_action :authorize!

  def show
    @followers  = current_user.followers
    @star_count = current_user.starred_count
    @following  = current_user.following
  end
end
