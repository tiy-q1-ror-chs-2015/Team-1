class EssaysController < ApplicationController
  before_action :set_student
  before_action :set_essay, only: [:show, :edit, :update, :destroy]
  before_action :set_new_essay, only: [:new, :create]
  before_action :set_form, only: [:new, :create, :edit, :update]

  def index
  @essays = @student.essays
  end

  def new 
  end

  def create
    if @form.validate(params[:essay])
      @form.save
      flash[:success] = 'Essay saved.'
      redirect_to_essay
    else
      flash[:error] = 'Could not save essay.'
      render :new
    end
  end  

  def update
    if @form.validate(params[:essay])
      @form.save
      flash[:success] = 'Essay saved.'
      redirect_to_essay
    else
      flash[:error] = 'Could not save essay.'
      render :new
    end
  end
  
  def show
  end

  def destroy
    if @essay.destroy
      flash[:success] = 'Essay deleted!'
      redirect_to action: :index
    else
      flash[:error] = 'Could not delete essay'
      render :show
    end
  end

  private

  def set_student
    @student = Student.find params[:student_id]
  end

  def set_essay
    @essay = Essay.find params[:id]
  end

  def set_new_essay
    @essay = @student.essay.new
  end
  
  def set_form
    @form = EssayForm.new(@essay)
  end

  def redirect_to_essay
    redirect_to [@student, @essay]
  end
end
