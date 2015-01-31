class WelcomeController < ApplicationController
  layout "no_sidebar"

  skip_authorization_check
  skip_authorize_resource

  def index
   @resource = resource
  end

end
