class RepositoriesController < ApplicationController

  def show
    @repositories = current_user.repositories_by_name
  end
end
