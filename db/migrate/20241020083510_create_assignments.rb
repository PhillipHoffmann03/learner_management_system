class CreateAssignments < ActiveRecord::Migration[7.2]
  def change
    create_table :assignments do |t|
      t.integer :course_id
      t.string :title
      t.text :description
      t.decimal :assignment_1
      t.decimal :assignment_2
      t.decimal :assignment_3
      t.decimal :exam
      t.decimal :test
      t.datetime :due_date
      

      t.timestamps
    end
  end
end
