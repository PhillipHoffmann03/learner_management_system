class Grade < ApplicationRecord
    belongs_to :user
    belongs_to :course
  
    validates :grade_value, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  end
  