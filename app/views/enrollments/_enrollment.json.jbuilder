json.extract! enrollment, :id, :student_id, :course_id, :status, :enrolled_at, :created_at, :updated_at
json.url enrollment_url(enrollment, format: :json)
