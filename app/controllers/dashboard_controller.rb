class DashboardController < ApplicationController
  def index
    @lecturers = User.where(role: 'instructor')
    @student = User.find_by(guardian_id: current_user.id, role: "student")

    

    if current_user.student?
      # Fetch the associated courses, assignments, attendances, and grades
      @courses = current_user.enrollments.includes(:course).map(&:course)
      @assignments = current_user.assignments
      @attendances = current_user.attendances
      @grades = current_user.grades.includes(:course)

    elsif current_user.guardian?  
      #this condition needs to change to @student = find student where guardian_id == current_user
      @student = User.find_by(guardian_id: current_user.id, role: "student")

      if @student.nil?
        @link_student_url = link_guardian_student_users_path  # Provide the link to link a student
      else
         
        @assignments = @student.assignments
        @attendances = @student.attendances
        @grades = @student.grades.includes(:course)

        # Handle nil cases (e.g., no courses, assignments, etc.)
        @courses = [] if @courses.nil?
        @assignments = [] if @assignments.nil?
        @attendances = [] if @attendances.nil?
        @grades = [] if @grades.nil?
      end

    elsif current_user.instructor?
      # Get the courses taught by the current instructor
      @courses = current_user.courses
    
      # Ensure @courses is not nil before calling pluck
      if @courses.present?
        # Get students enrolled in the courses taught by the instructor
        @students = User.joins(:enrollments)
                        .where(enrollments: { course_id: @courses.pluck(:id) })
                        .where(role: "student")
      else
        # If the instructor is not teaching any courses, set @students to an empty array
        @students = []
      end

    elsif current_user.admin?
      @users = User.all  # Admin sees all users

      # Handle nil case for users
      @users = [] if @users.nil?
    end
  end

  def send_email
    # Get the selected lecturer and message details
    lecturer = User.find(params[:lecturer_id])  # Find the lecturer based on selected lecturer_id
  
    # Assuming the current_user is a guardian, find the student associated with the guardian
    student = User.find_by(guardian_id: current_user.id, role: 'student')  # Find student by guardian_id
  
    if student
      # Create the subject with student's name
      subject = "#{student.first_name} #{student.last_name} - Enquiry"  # Subject
    else
      flash[:alert] = "No linked student found for your account."
      redirect_to dashboard_path and return
    end
  
    message = params[:message]  # The message from the form
  
    # Generate a mailto link to open the email client with the subject and message pre-filled
    email_address = lecturer.email
    mail_to_link = "mailto:#{email_address}?subject=#{subject}&body=#{message}"
  
    # Redirect to the mailto link (allow redirect to external links)
    redirect_to mail_to_link, allow_other_host: true , notice: "Please continue in your mail app!"
  
    # Don't include another redirect here, instead use return to end the method
    # This prevents the second redirect_to from being called
    return
  end
  
  
  

  def link_student
    student = User.find_by(id: params[:student_id])

    if student && current_user.guardian?
      # Link the current guardian to the student by updating `guardian_id`
      student.update(guardian_id: current_user.id)
      flash[:notice] = "#{student.first_name} has been successfully linked to your account."
    else
      flash[:alert] = "Unable to link student. Please try again."
    end

    redirect_to dashboard_path
  end
end
