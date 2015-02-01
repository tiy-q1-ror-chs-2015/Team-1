class WelcomeController < ApplicationController
  layout "no_sidebar"

  skip_authorization_check

  def index
   @resource = resource
  end

end
