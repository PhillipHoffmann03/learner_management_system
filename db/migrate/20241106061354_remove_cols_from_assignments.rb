class RemoveColsFromAssignments < ActiveRecord::Migration[7.2]
  def change
    change_table :assignments do |t|
      t.remove :assignment_2, :assignment_3, :exam, :test
      t.string :assignment_file # New column for file upload
    end
  end
end
