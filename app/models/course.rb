class Course < ApplicationRecord
    has_many :assignments
    has_many :enrollments
    belongs_to :instructor, class_name: 'User'
    has_many :attendances

  end
  