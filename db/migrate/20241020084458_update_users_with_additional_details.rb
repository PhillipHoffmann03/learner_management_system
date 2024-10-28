class UpdateUsersWithAdditionalDetails < ActiveRecord::Migration[7.2]
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.date :date_of_birth
      t.string :nationality
      t.string :gender
      t.string :student_grade_level
      t.string :student_course_enrolled
    end
  end
end
