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

    picture = params[:problem][:picture]
    puts "class #{picture.class}"

    file_extension = File.extname(picture.original_filename)
    new_file_name = SecureRandom.uuid

    File.open(Rails.root.join('public', 'uploads', "#{new_file_name}#{file_extension}"), 'wb') do |file|
      file.write picture.read
    end

    @problem = Problem.new(problem_params)
    @problem.picture = "#{new_file_name}#{file_extension}"
    @problem.user_id = session[:user_id]
    if @problem.valid?
      @problem.save
      flash[:notice] = "Data berhasil disimpan"
      redirect_to "/"
    else
      render "new"
    end

  end

  private
    def problem_params
      params.require(:problem).permit(:title, :description, :picture, :user_id)
    end

end
