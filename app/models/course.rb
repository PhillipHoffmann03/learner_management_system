class Course < ApplicationRecord
  belongs_to :user
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :assignments
  has_many :grades
  has_many :attendances

  validates :title, presence: true
  validates :description, presence: true
end
