class School < ActiveRecord::Base
  has_many :students, through: :student_schools
  has_many :student_schools, dependent: :destroy

  has_many :goalpaths, through: :goalpath_schools
  has_many :goalpath_schools, dependent: :destroy
end
