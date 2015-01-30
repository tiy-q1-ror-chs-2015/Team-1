class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_new_student, only: [:new, :create]
  before_action :set_form, only: [:new, :create, :update, :edit]

  def index
    @students = Student.all

  end

  def show
    # before: set_student
  end

  def edit
    # before: set_student and set_form
  end

  def new
    # before: set_new_student and set_form
  end

  def create
    # before: set_new_student and set_form
    if @form.validate(params[:student])
      @form.save
      flash[:success] = 'Student saved'
      redirect_to @student
    else
      flash[:error] = 'Could not save student'
      render :new
    end
  end

  def update
    # before: set_student and set_form
    if @form.validate(params[:student])
      @form.save
      flash[:success] = 'Student updated'
      redirect_to @student
    else
      flash[:error] = 'Could not save student'
      render :edit
    end
  end

  def destroy
    # before: set_student
    if @student.destroy
      flash[:success] = 'Student deleted!'
      redirect_to students_path
    else
      flash[:error] = 'Could not delete student'
      render :show
    end
  end



  private

  def set_student
    @student = Student.find(params[:id])
  end

  def set_new_student
    @student = Student.new
  end

  def set_form
    @form = StudentForm.new(@student)
  end

end