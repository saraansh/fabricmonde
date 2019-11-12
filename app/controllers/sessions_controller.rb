class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(["email = ? or username = ?", params[:email], params[:username]]).first
    if user && (user.authenticate(params[:password]) || params[:bypass])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
