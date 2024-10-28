json.extract! submission, :id, :assignment_id, :student_id, :submission_date, :grade, :feedback, :created_at, :updated_at
json.url submission_url(submission, format: :json)
