class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password]) # Use bcrypt's authenticate method
      session[:user_id] = @user.id # Store user ID in session
      redirect_to root_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid username or password.'
      render :new # Re-render the login form
    end
  end

  def destroy
    session[:user_id] = nil # Clear the session
    redirect_to root_path, notice: 'Logged out successfully.'
  end
end
