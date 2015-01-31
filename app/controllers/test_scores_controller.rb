class TestScoresController < ApplicationController
  before_action :set_student
  before_action :set_test_score, only: [:show, :edit, :update, :destroy]
  before_action :set_new_test_score, only: [:new, :create]
  before_action :set_form, only: [:new, :create, :update, :edit]

  # BEFORE ALL ACTIONS: set_student

  def index
    @test_scores = @student.test_scores
  end

  def show
    # before: set_test_score
  end

  def new

  end

  def create
    # before: set_new_test_score and set_form
    if @form.validate(params[:test_score])
      @form.save
      flash[:success] = 'Test Score saved.'
      redirect_to_test_score
    else
      flash[:error] = 'Could not save test score.'
      render :new
    end
  end

  def edit
    # before: set_test_score and set_form
  end

  def update
    # before: set_test_score and set_form
    if @form.validate(params[:test_score])
      @form.save
      flash[:success] = 'Test Score updated.'
      redirect_to_test_score
    else
      flash[:error] = 'Could not update test score.'
      render :edit
    end
  end

  def destroy
    # before: set_test_score
    if @test_score.destroy
      flash[:success] = 'Test Score deleted!'
      redirect_to action: :index
    else
      flash[:error] = 'Could not delete test score.'
      render :show
    end
  end
  
private
  def set_student
    @student = Student.find params[:student_id]
  end

  def set_test_score
    @test_score = Test_Score.find params[:id]
  end

  def set_new_test_score
    @test_score = @student.test_scores.new
  end

  def set_form
    @form = Test_ScoreForm.new(@test_score)
  end

  def redirect_to_test_score
    redirect_to [@student, @test_score]
  end
end