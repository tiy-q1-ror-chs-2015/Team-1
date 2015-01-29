class SkillsController < ApplicationController
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
  def skill_params
    params.require(:test_scores)permit (
      :skill_name
      :description
      :student_id
      )
  end
end
