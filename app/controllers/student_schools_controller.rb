class StudentSchoolsController < ApplicationController
  before_action :set_student
  before_action :set_student_schools
  # before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_action :set_form, only: [:new, :create, :update, :edit]

  load_and_authorize_resource :student
  load_and_authorize_resource :student_school, through: :student

  # Check authorization for every controller
  check_authorization

  # BEFORE ALL ACTIONS: set_student

  def show
    # before: set_student_school
  end

  def new

  end

  def create
    # before: set_new_student_school and set_form
    if @form.validate(params[:student_school])
      @form.save
      flash[:success] = 'Goalpath saved.'
      redirect_to_student_school
    else
      flash[:error] = 'Could not save student_school.'
      render :new
    end
  end

  def edit
    # before: set_student_school and set_form
  end

  def update
    # before: set_student_school and set_form
    if @form.validate(params[:student_school])
      @form.save
      flash[:success] = 'Goalpath updated.'
      redirect_to_student_school
    else
      flash[:error] = 'Could not update student_school.'
      render :edit
    end
  end

  # def destroy
  #   # before: set_student_school
  #   if @student_school.destroy
  #     flash[:success] = 'Goalpath deleted!'
  #     redirect_to action: :index
  #   else
  #     flash[:error] = 'Could not delete student_school'
  #     render :show
  #   end
  # end

  private

  def set_student
    @student = Student.find params[:student_id]
  end

  def set_student_schools
    @student_schools = @student.student_schools
  end
  #
  # def set_school
  #   @student_school.school
  # end

  def set_form
    @form = GoalpathForm.new(@student_school)
  end

  # def redirect_to_student_school
  #   redirect_to [@student, @student_school]
  # end
end