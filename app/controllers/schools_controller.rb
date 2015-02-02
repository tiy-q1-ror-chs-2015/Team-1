class SchoolsController < ApplicationController
  load_and_authorize_resource

  # Check authorization for every controller
  check_authorization

  def index
    @schools = School.paginate(page: params[:page])
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

  def search
    r = School.search { fulltext params[:query] }.results
    respond_to do |format|
      # Only send back the id and school_name
      format.json { render json: r.map{|c| {id:c.id, school_name:c.school_name}}}
    end
  end

  def add
    result = AddFavoriteSchool.call(school: @school, user:current_user)
    respond_to do |format|
      if result.success?
        format.js { render locals: {message: result.message, type: :success, id:@school.id} }
      else
        format.js { render locals: {message: result.message, type: :error} }
      end
    end
  end

  def remove
    result = RemoveFavoriteSchool.call(school: @school, user:current_user)
    respond_to do |format|
      if result.success?
        format.js { render locals: {message: result.message, type: :success, id:@school.id} }
      else
        format.js { render locals: {message: result.message, type: :error} }
      end
    end
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