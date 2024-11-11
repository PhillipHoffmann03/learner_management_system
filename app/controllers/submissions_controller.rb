class SubmissionsController < ApplicationController
  
  before_action :set_submission, only: %i[ show edit update destroy ]
  # layout "template"
  # def index
  #   if current_user.student? || current_user.guardian?
  #     # Show submissions for courses the current user (or their linked student) is enrolled in
  #     @submissions = Submission.joins(assignment: { course: :enrollments })
  #                              .where(enrollments: { user_id: current_user.id })
  #   else
  #     # Show all submissions for instructors and admins
  #     @submissions = Submission.all
  #   end
  # end

  def index
    if current_user.instructor?
      # Show all submissions for instructors
      @submissions = Submission.all
    elsif current_user.guardian?
      # If the user is a guardian, show only submissions of their linked student
      @student = User.find_by(guardian_id: current_user.id, role: "student")
  
      if @student
        # Show submissions for the linked student
        @submissions = Submission.where(user_id: @student.id)
      else
        # If no student is linked to the guardian, show an alert or an empty list
        flash[:alert] = "No student is linked to your account."
        @submissions = []
      end
    elsif current_user.student?
      # Show only submissions for the current student
      @submissions = Submission.where(user_id: current_user.id)
    else
      # For other roles, show all submissions (e.g., admin)
      @submissions = Submission.all
    end
  end
  
  
  
    def show
      @submission = Submission.find(params[:id])
    end
  
    def new
      @submission = Submission.new
      @assignments = Assignment.all
    end
  
    def create
      @assignments = Assignment.all
      @submission = Submission.new(submission_params)
      if @submission.save
        redirect_to submissions_path, notice: 'Submission was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @submission = Submission.find(params[:id])
    end
  
    def update
      @submission = Submission.find(params[:id])
      if @submission.update(submission_params)
        redirect_to submissions_path, notice: 'Submission was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @submission = Submission.find(params[:id])
      @submission.destroy
      redirect_to submissions_path, notice: 'Submission was successfully deleted.'
    end
  
    private

    def set_submission
      @submission = Submission.find(params[:id])
    end
  
    def submission_params
      params.require(:submission).permit(:assignment_id, :user_id, :submission_date, :grade, :feedback ,:file,:student_number)
    end
  end
  
 
  

  
  


  