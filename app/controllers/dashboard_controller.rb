class DashboardController < ApplicationController
  def index
    @courses = current_user.courses
    @attendances = current_user.attendances
    @grades = current_user.grades.includes(:course)
    # Ensure @assignments, @submissions, and other associations as necessary
  end
end
