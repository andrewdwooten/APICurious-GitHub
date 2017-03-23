class CommitsController < ApplicationController
  before_action :authorize!

  def show
    @commits = current_user.recent_commits
  end
end
