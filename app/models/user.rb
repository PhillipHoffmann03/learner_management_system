class User < ApplicationRecord
    has_secure_password
  
    has_many :enrollments
    has_many :courses
    has_many :attendances
    has_many :grades
    has_many :submissions

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :role, presence: true

    def full_name
      "#{first_name} #{last_name}"
    end

    def student?
      role == 'student'
    end
  
    def instructor?
      role == 'instructor'
    end
  
    def guardian?
      role == 'guardian'
    end
  
    def admin?
      role == 'admin'
    end
  end
  