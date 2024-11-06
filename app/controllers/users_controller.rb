class UsersController < ApplicationController
  # In your UsersController or relevant controller
  def new
    @user = User.new
    @courses = Course.all.pluck(:title, :id) # Fetching course titles and their corresponding IDs
  end


  def create
    @user = User.new(user_params)
    if @user.save
      # Add your logic here for a successful save, like redirecting to a login page
      redirect_to root_path, notice: 'User created successfully.'
    else
      # This will render the 'new' template again, where @user will not be nil
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :role, :first_name, :last_name, :address, :phone_number, :date_of_birth, :nationality, :gender, :student_grade_level, :student_course_enrolled)
  end
end
