class GoalpathsController < ApplicationController
  before_action :set_student
  before_action :set_goalpath, only: [:show, :edit, :update, :destroy]
  before_action :set_new_goalpath, only: [:new, :create]
  before_action :set_form, only: [:new, :create, :update, :edit]


  load_and_authorize_resource :student
  load_and_authorize_resource :goalpath, through: :student

  # Check authorization for every controller
  check_authorization

  # BEFORE ALL ACTIONS: set_student

  def index
    @goalpaths = @student.goalpaths
  end

  def show
    # before: set_goalpath
  end

  def new
    
  end

  def create
    # before: set_new_goalpath and set_form
    if @form.validate(params[:goalpath])
      @form.save
      flash[:success] = 'Goalpath saved.'
      redirect_to_goalpath
    else
      flash[:error] = 'Could not save goalpath.'
      render :new
    end
  end

  def edit
    # before: set_goalpath and set_form
  end

  def update
    # before: set_goalpath and set_form
    if @form.validate(params[:goalpath])
      @form.save
      flash[:success] = 'Goalpath updated.'
      redirect_to_goalpath
    else
      flash[:error] = 'Could not update goalpath.'
      render :edit
    end
  end

  def destroy
    # before: set_goalpath
    if @goalpath.destroy
      flash[:success] = 'Goalpath deleted!'
      redirect_to action: :index
    else
      flash[:error] = 'Could not delete goalpath'
      render :show
    end
  end

  private

  def set_student
    @student = Student.find params[:student_id]
  end

  def set_goalpath
    @goalpath = Goalpath.find params[:id]
  end

  def set_new_goalpath
    @goalpath = @student.goalpaths.new
  end

  def set_form
    @form = GoalpathForm.new(@goalpath)
  end

  def redirect_to_goalpath
    redirect_to [@student, @goalpath]
  end
end