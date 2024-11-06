class Enrollment < ApplicationRecord
    belongs_to :user
    belongs_to :course
  
    validates :status, presence: true
    validates :enrolled_at, presence: true
  end
  