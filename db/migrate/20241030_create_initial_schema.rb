class CreateInitialSchema < ActiveRecord::Migration[7.2]
    def change
      enable_extension "plpgsql"
  
      # Users table
      create_table :users do |t|
        t.string :username
        t.string :password_digest
        t.string :email
        t.string :role
        t.string :first_name
        t.string :last_name
        t.string :address
        t.string :phone_number
        t.date :date_of_birth
        t.string :nationality
        t.string :gender
        t.string :student_grade_level
        t.string :student_course_enrolled
        t.timestamps
      end
  
      # Courses table
      create_table :courses do |t|
        t.string :title
        t.text :description
        t.integer :instructor_id
        t.timestamps
      end
  
      # Assignments table
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
      add_index :assignments, :course_id
  
      # Enrollments table
      create_table :enrollments do |t|
        t.integer :user_id
        t.integer :course_id
        t.string :status
        t.datetime :enrolled_at
        t.timestamps
      end
      add_index :enrollments, :user_id
      add_index :enrollments, :course_id
  
      # Attendances table
      create_table :attendances do |t|
        t.bigint :user_id, null: false
        t.bigint :course_id, null: false
        t.date :date
        t.string :status
        t.timestamps
      end
      add_index :attendances, :user_id
      add_index :attendances, :course_id
  
      # Grades table
      create_table :grades do |t|
        t.integer :user_id
        t.integer :course_id
        t.decimal :grade_value
        t.timestamps
      end
      add_index :grades, :user_id
      add_index :grades, :course_id
  
      # Submissions table
      create_table :submissions do |t|
        t.integer :assignment_id
        t.integer :user_id
        t.datetime :submission_date
        t.decimal :grade
        t.text :feedback
        t.timestamps
      end
      add_index :submissions, :assignment_id
      add_index :submissions, :user_id
  
      # Foreign key constraints
      add_foreign_key :attendances, :users
      add_foreign_key :attendances, :courses
      add_foreign_key :enrollments, :users
      add_foreign_key :enrollments, :courses
      add_foreign_key :grades, :users
      add_foreign_key :grades, :courses
      add_foreign_key :submissions, :assignments
      add_foreign_key :submissions, :users
    end
  end
  