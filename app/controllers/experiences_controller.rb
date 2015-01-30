class ExperiencesController < ApplicationController
  before_action :set_student
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_action :set_new_experience, only: [:new, :create]
  before_action :set_form, only: [:new, :create, :update, :edit]

  # BEFORE ALL ACTIONS: set_student

  def index
    @experiences = @student.experiences
  end

  def show
    # before: set_experience
  end

  def new
    # before: set_new_experience and set_form
  end

  def create
    # before: set_new_experience and set_form
    if @form.validate(params[:experience])
      @form.save
      flash[:success] = 'Experience saved.'
      redirect_to_experience
    else
      flash[:error] = 'Could not save experience.'
      render :new
    end
  end

  def edit
    # before: set_experience and set_form
  end

  def update
    # before: set_experience and set_form
    if @form.validate(params[:experience])
      @form.save
      flash[:success] = 'Experience updated.'
      redirect_to_experience
    else
      flash[:error] = 'Could not update experience.'
      render :edit
    end
  end

  def destroy
    # before: set_experience
    if @experience.destroy
      flash[:success] = 'Experience deleted!'
      redirect_to @student
    else
      flash[:error] = 'Could not delete experience'
      render :show
    end
  end

  private

  def set_student
    @student = Student.find params[:student_id]
  end

  def set_experience
    @experience = Experience.find params[:id]
  end

  def set_new_experience
    @experience = @student.experiences.new
  end

  def set_form
    @form = ExperienceForm.new(@experience)
  end

  def redirect_to_experience
    redirect_to [@student, @experience]
  end
end
