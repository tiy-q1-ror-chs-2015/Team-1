class StudentsController < ApplicationController
  def index
    @students = Student.all

  end

  def new
    @student = Student.new
  end

  def create
  end

  def show
    @student = Student.find params[:id]
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

end