class WelcomeController < ApplicationController
  layout "no_sidebar"

  def index
   @resource = resource
  end

end
