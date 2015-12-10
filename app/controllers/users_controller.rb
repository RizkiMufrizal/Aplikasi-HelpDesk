class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      UserNotification.send_verification_email(@user).deliver
      flash[:notice] = "Anda berhasil melakukan register, silahkan lakukan verifikasi email anda"
      redirect_to "/login"
    else
      render "new"
    end

  end

  def verification
      @user = User.find(params[:id])
      @user.enable = true
      if @user.save
        flash[:notice] = "Anda berhasil melakukan verifikasi, silahkan login"
        redirect_to "/login"
      end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password_hash)
    end

end
