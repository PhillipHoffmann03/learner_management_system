class AddStudentNumberToAssignments < ActiveRecord::Migration[7.2]
  def change
    add_column :assignments, :student_number, :string
  end
end
