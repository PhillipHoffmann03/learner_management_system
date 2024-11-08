class DashboardController < ApplicationController
  def index
    if current_user.student?
      @courses = current_user.courses
      @assignments = current_user.assignments
      @attendances = current_user.attendances
      @grades = current_user.grades.includes(:course)
    elsif current_user.guardian?
      @student = current_user if current_user.role == "student"

      if @student.nil?
        @link_student_url = link_guardian_student_users_path  # Provide the link to link a student
      else
        @courses = @student.courses
        @assignments = @student.assignments
        @attendances = @student.attendances
        @grades = @student.grades.includes(:course)
      end
    elsif current_user.instructor?
      @students = current_user.students
      @courses = current_user.courses
    elsif current_user.admin?
      @users = User.all  # Admin sees all users
    end
  end
end
