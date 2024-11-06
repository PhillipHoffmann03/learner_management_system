class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :date, presence: true
  validates :status, presence: true
end
