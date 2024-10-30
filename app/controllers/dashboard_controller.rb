# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
    before_action :authenticate_user!
  
    def index
      # Any code for the dashboard page
    end

    def show
        @courses = current_user.courses if current_user.role == 'student'
        @attendance = current_user.attendance_records if current_user.role == 'student'
        @grades = current_user.grades if current_user.role == 'student'
        # Add more data as needed based on user role
      end
  end
  

  
  