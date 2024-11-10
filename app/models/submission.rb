class Submission < ApplicationRecord
    belongs_to :assignment
    belongs_to :user
    has_one_attached :file
    validates :submission_date, presence: true
    validates :grade, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true
end
  