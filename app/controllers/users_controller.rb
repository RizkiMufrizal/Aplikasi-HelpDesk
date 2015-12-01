class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      flash[:notice] = "Anda berhasil melakukan register, silahkan login"
      redirect_to "/login"
    else
      render "new"
    end

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password_hash)
    end

end
