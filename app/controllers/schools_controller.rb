class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.create school_params
    redirect_to schools_path
  end

  def show
    @school = School.find params[:id]
  end
  def edit
    @school = Medication.find params[:id]
  end
private
  def school_params
    params.require(:school).permit(
      :application_deadline,
      :average_sat,
      :average_act,
      :school_name,
      :student_population,
      :city,
      :state,
      :comment
      )
  end
end