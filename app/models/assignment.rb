class Assignment < ApplicationRecord
  belongs_to :course
  has_many :submissions

  validates :title, presence: true
  validates :description, presence: true
end
