class SessionsController < ApplicationController

  def new
    if signed_in?
      redirect_to "/administrator/sections"
    end
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to "/administrator/sections"
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to "/"
  end

end
