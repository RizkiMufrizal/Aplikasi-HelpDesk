class ProblemsController < ApplicationController

  def index

    if session[:user_login]
      @problems = Problem.where(user_id: session[:user_id]).paginate(:page => params[:page], :per_page => 10)
    else
      redirect_to "/login"
    end

  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
  end

  private
    def problem_params
      params.require(:problem).permit(:title, :description, :picture, :user_id)
    end

end
