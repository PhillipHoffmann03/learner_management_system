class User < ApplicationRecord

  # Define the roles in the model for convenience
    ROLES = %w[Admin Guardian Student Instructor].freeze
    has_secure_password
  
    has_many :enrollments
    has_many :courses
    has_many :attendances
    has_many :grades
    has_many :submissions
    has_many :students, class_name: 'User', foreign_key: 'guardian_id', dependent: :nullify
    belongs_to :guardian, class_name: 'User', optional: true

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

    def role?(role_name)
      role == role_name.to_s
    end
    
  end
  