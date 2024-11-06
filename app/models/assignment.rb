class Assignment < ApplicationRecord
  
  has_many :submissions
  belongs_to :course
  has_one_attached :assignment_file # Allows file attachment for the assignment

  validates :title, presence: true
  validates :description, presence: true
end
