class TestsController < ApplicationController
  def index
    @tests= Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.valid?
	     @test.save
       redirect_to @test
    else
	     render :new
     end
  end

  private

  def test_params
		params.require(:test).permit(:student_first_name, :student_last_name, :grade, :minutes_taken)
	end

end
