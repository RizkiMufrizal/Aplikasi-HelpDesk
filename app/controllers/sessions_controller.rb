class SessionsController < ApplicationController

  def login

  end

  def process_login
    @user = User.authenticate(params[:email], params[:password])
    if @user && @user.enable == true && @user.role == "ROLE_USER"
      flash[:notice] = "Anda berhasil login"
      redirect_to "/"
    else
      flash[:danger] = "username dan password masih salah"
      render "login"
    end
  end

end
