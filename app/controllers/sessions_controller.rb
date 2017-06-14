class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash.now[:notice] = 'Welcome, '+user.email+"!"
      redirect_to statuses_path
    else
      flash.now[:alert] = 'Please log in again'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
