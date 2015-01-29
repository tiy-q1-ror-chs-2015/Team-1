class School < ActiveRecord::Base
  has_many :students, through: :student_schools
  has_many :student_schools
end
