class Course < ApplicationRecord
  validates :short_name, presence: true, length: {minimum: 2, maximum: 15}
  validates :name, presence: true, length: {minimum: 5, maximum: 20}
  validates :description, presence: true, length: {minimum: 5, maximum: 30}
  has_many :student_courses
  has_many :students, through: :student_courses
end
