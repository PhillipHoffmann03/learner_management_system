class CreateEnrollments < ActiveRecord::Migration[7.2]
  def change
    create_table :enrollments do |t|
      t.integer :student_id
      t.integer :course_id
      t.string :status
      t.timestamp :enrolled_at

      t.timestamps
    end
  end
end
