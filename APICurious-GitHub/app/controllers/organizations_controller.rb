class OrganizationsController < ApplicationController
  before_action :authorize!

  def show
    @organizations = current_user.organizations
  end
end
