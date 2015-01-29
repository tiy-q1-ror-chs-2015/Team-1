class TestScoresController < ApplicationController
  def index
  end

  def new 
  end

  def create
  end  

  def show
  end

  def destroy
  end
  
  private
    def test_params
      params.require(:test_scores)permit (
        :name
        :score
        :date_taken  
        )
    end
end
