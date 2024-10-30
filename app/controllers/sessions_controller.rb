# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    # Renders the login form
  end

  def create
    # Find the user by username
    user = User.find_by(username: params[:username])
    
    # Authenticate the user and check if the password matches
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  # Store user ID in session to keep them logged in
      redirect_to dashboard_path, notice: "Logged in successfully!"  # Redirect to dashboard on success
    else
      flash[:alert] = "Invalid username or password"
      render :new  # Render login form again if authentication fails
    end
  end
  

  def destroy
    session[:user_id] = nil  # Log out the user by clearing the session
    redirect_to login_path, notice: "Logged out successfully!"
  end
end
