class ProblemsController < ApplicationController

  def index

    if session[:user_login]

    else
      redirect_to "/login"
    end

  end

  def admin
    if session[:user_role]
      @problems = Problem.paginate(:page => params[:page], :per_page => 5)
    else
      redirect_to "/login"
    end
  end

  def new
    @problem = Problem.new
  end

  def create

    picture = params[:problem][:picture]

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

  def show
    @problems = Problem.where(user_id: session[:user_id]).paginate(:page => params[:page], :per_page => 5)
  end

  def showDisable
    @problems = Problem.where(user_id: session[:user_id], status: 'sedang dikerjakan').paginate(:page => params[:page], :per_page => 5)
  end

  def showEnable
    @problems = Problem.where(user_id: session[:user_id], status: 'selesai').paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def update
    @problem = Problem.find(params[:id])

    picture = params[:problem][:picture]

    if picture
      file_extension = File.extname(picture.original_filename)
      new_file_name = SecureRandom.uuid

      File.open(Rails.root.join('public', 'uploads', "#{new_file_name}#{file_extension}"), 'wb') do |file|
        file.write picture.read
      end

      @problem.picture = "#{new_file_name}#{file_extension}"

      if @problem.save
        redirect_to "/problem/detail"
      else
        render "edit"
      end
    else
      if @problem.update(problem_params_update)
        redirect_to "/"
      end
    end

  end

  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    redirect_to "/problem/detail"
  end

  private
    def problem_params
      params.require(:problem).permit(:title, :description, :picture, :user_id)
    end

    def problem_params_update
      params.require(:problem).permit(:title, :description, :user_id, :status)
    end

end
