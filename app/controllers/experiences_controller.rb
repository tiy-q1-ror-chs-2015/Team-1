class ExperiencesController < ApplicationController
  before_action :set_student
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = @student.experiences
  end

  def new
    @experience = @student.experiences.new
    @form = ExperienceForm.new(@experience)
  end

  def create
    @experience = @student.experiences.new
    @form = ExperienceForm.new(@experience)
    if @form.validate(params[:experience])
      @form.save
      flash[:success] = 'Experience saved.'
      redirect_to @experience
    else
      flash[:error] = 'Could not save experience.'
      render :new
    end
  end  

  def show
  end

  def destroy
  end

  def set_student
    @student = Student.find params[:student_id]
  end

  def set_experience
    @experience = Experience.find params[:id]
  end
end
