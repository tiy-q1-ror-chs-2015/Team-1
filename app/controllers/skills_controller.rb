class SkillsController < ApplicationController
  before_action :set_student
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  before_action :set_new_skill, only: [:new, :create]
  before_action :set_form, only: [:new, :create, :edit, :update]

  def index
    @skills = @student.skills
  end

  def new 
  end

  def create
    if @form.validate(params[:skill])
      @form.save
      flash[:success] = 'Skill saved.'
      redirect_to_skill
    else
      flash[:error] = 'Could not save skill.'
      render :new
    end
  end  
  def update
    if @form.validate(params[:skill])
      @form.save
      flash[:success] = 'Skill saved.'
      redirect_to_skill
    else
      flash[:error] = 'Could not save skill.'
      render :new
    end
  end

  def show
  end

  def destroy
    if @skill.destroy
      flash[:success] = 'Skill deleted!'
      redirect_to action: :index
    else
      flash[:error] = 'Could not delete skill'
      render :show
    end
  end

  private


  def set_student
    @student = Student.find params[:student_id]
  end

  def set_skill
    @skill = Skill.find params[:id]
  end

  def set_new_skill
    @skill = @student.skill.new
  end
  
  def set_form
    @form = SkillForm.new(@skill)
  end

  def redirect_to_skill
    redirect_to [@student, @skill]
  end
end
