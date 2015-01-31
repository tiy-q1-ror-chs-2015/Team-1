class ReferencesController < ApplicationController
  before_action :set_student
  before_action :set_reference, only: [:show, :edit, :update, :destroy]
  before_action :set_new_reference, only: [:new, :create]
  before_action :set_form, only: [:new, :create, :update, :edit]

  # BEFORE ALL ACTIONS: set_student

  def index
    @references = @student.references
  end

  def show
    # before: set_reference
  end

  def new 

  end

  def create
    # before: set_new_reference and set_form
    if @form.validate(params[:reference])
      @form.save
      flash[:success] = 'Reference saved.'
      redirect_to student_references_path
    else
      flash[:error] = 'Could not save reference.'
      render :new
    end
  end  

  def edit
    # before: set_reference and set_form
  end

  def update
    # before: set_reference and set_form
    if @form.validate(params[:reference])
      @form.save
      flash[:success] = 'Reference updated.'
      redirect_to_reference
    else
      flash[:error] = 'Could not update reference.'
      render :edit
    end
  end

  def destroy
    # before: set_reference
    if @reference.destroy
      flash[:success] = 'Reference deleted!'
      redirect_to action: :index
    else
      flash[:error] = 'Could not delete reference.'
      render :show
    end
  end

private

  def set_student
    @student = Student.find params[:student_id]
  end

  def set_reference
    @reference = Reference.find params[:id]
  end

  def set_new_reference
    @reference = @student.references.new
  end

  def set_form
    @form = ReferenceForm.new(@reference)
  end

  def redirect_to_reference
    redirect_to [@student, @reference]
  end
end
