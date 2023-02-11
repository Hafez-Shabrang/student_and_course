class Student < ApplicationRecord
  validates :name, presence: true, length: {minimum: 4, maximum: 20}
  validates :email, presence: true, length: {minimum: 10, maximum: 50}
  validates :password, presence: true
  has_secure_password
  has_many :student_courses
  has_many :courses, through: :student_courses
end
