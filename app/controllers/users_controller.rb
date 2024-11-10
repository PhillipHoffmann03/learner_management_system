class UsersController < ApplicationController
  #before_action :authenticate_user!  # Assuming you're using Devise or a similar auth method

  def new
    @user = User.new
    @courses = Course.all.pluck(:title, :id)  # Fetching course titles and their corresponding IDs
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'User created successfully.'
    else
      render :new
    end
  end

  def index
    @users = User.all
    # You can add custom filtering logic based on the role of the logged-in user.
    # Uncomment and adjust the logic based on the roles you need
    if current_user.admin?
      @users = User.all
    elsif current_user.instructor?
      @users = User.where(role: 'student')
    elsif current_user.guardian?
      @students = current_user.students  # Assuming the guardian is associated with students
    else
      @users = []  # Empty for non-logged-in or unauthorized users
    end
  end

  # Action to show the link guardian-student page
  def link_guardian_student
    if current_user.guardian?
      # Fetch students that the guardian can link to
      @students = User.where(role: 'student', guardian_id: nil)  # Only show students not already linked
    else
      redirect_to dashboard_path, alert: "You are not authorized to link students."
    end
  end

  # Action to link a student to a guardian (PUT)
  def link_student
    student = User.find(params[:id])

    if current_user.guardian? && student.role == 'student'
      student.update(guardian_id: current_user.id) # Link the student to the guardian
      redirect_to dashboard_path, notice: "Student successfully linked to your account."
    else
      redirect_to dashboard_path, alert: "You are not authorized to link this student."
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :role, :first_name, :last_name, :address, :phone_number, :date_of_birth, :nationality, :gender, :student_grade_level, :student_course_enrolled)
  end
end
