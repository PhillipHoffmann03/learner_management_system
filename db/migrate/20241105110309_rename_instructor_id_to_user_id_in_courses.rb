class RenameInstructorIdToUserIdInCourses < ActiveRecord::Migration[7.2]
  def change
    rename_column :courses, :instructor_id, :user_id
  end
end
