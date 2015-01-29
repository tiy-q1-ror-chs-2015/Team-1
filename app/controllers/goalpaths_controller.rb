class GoalpathsController < ApplicationController
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
  def goal_params
    params.require(:test_scores)permit (
      :end_goal,
      :student_id
      )
  end
end
