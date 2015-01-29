class ExperiencesController < ApplicationController
   def index
  end

  def new 
  end

  def create
  end  

  def show
  end

  def destroy
  end

  private
  def exp_params
    params.require(:test_scores)permit (
      :title,
      :description
      )
  end
end
