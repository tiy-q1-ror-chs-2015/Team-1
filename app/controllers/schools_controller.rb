class SchoolsController < ApplicationController
  load_and_authorize_resource

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
    @school = School.find params[:id]
  end

  def update
    @school = School.find params[:id]
    @school.update_attributes school_params
    redirect_to school_path(@school)
  end
  def destroy
    @school = School.find params[:id]
    @school.delete
    redirect_to schools_path
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
      :state_id,
      :comment
      )
  end
end