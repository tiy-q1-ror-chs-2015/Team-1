class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def new
    @form = StudentForm.new(Student.new)
  end

  def create
    @student = Student.new
    @form = StudentForm.new(@student)
    if @form.validate(params[:student])
      @form.save
      flash[:success] = 'Student saved'
      redirect_to @student.show
    else
      flash[:error] = 'Could not save student'
      render :new
    end
  end

  def show
  end

  def destroy
  end



  private 
    def s_params
      params.require(:students).permit(
        :first_name,
        :last_name,
        :address,
        :city,
        :state,
        :zip
        )

    end

  def set_student
    @student = Student.find(params[:id])
  end

end