class CreateSubmissions < ActiveRecord::Migration[7.2]
  def change
    create_table :submissions do |t|
      t.integer :assignment_id
      t.integer :student_id
      t.timestamp :submission_date
      t.decimal :grade
      t.text :feedback

      t.timestamps
    end
  end
end
