class SessionsController < ApplicationController

  def login

  end

  def process_login
    @user = User.authenticate(params[:email], params[:password])
    if @user && @user.enable == true && @user.role == "ROLE_USER"
      flash[:notice] = "Anda berhasil login"
      session[:user_name] = @user.name
      session[:user_id] = @user.id
      session[:user_email] = @user.email
      session[:user_login] = true
      redirect_to "/"
    else
      flash[:danger] = "username dan password masih salah"
      render "login"
    end
  end

  def logout
    flash[:notice] = "Anda berhasil logout"
    session[:user_name] = nil
    session[:user_email] = nil
    session[:user_login] = false
    redirect_to action: "login"
  end

end
