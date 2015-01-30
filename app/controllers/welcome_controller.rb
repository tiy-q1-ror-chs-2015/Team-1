class WelcomeController < ApplicationController

  def index
   @goalpath = Goalpath.find params[:id]
   @goalpath = Goalpath.find params[:id]
  end

end
