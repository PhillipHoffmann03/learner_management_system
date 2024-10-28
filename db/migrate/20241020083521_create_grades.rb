class CreateGrades < ActiveRecord::Migration[7.2]
  def change
    create_table :grades do |t|
      t.integer :student_id
      t.integer :course_id
      t.decimal :grade_value
      

      t.timestamps
    end
  end
end
