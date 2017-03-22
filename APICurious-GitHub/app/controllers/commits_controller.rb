class CommitsController < ApplicationController

  def show
    @commits = current_user.recent_commits
  end
end
