class EssaysController < ApplicationController
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
  def essay_params
    params.require(:test_scores)permit (
      :topic,
      :content
      )
  end
end
