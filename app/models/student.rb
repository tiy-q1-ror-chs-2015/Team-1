class Student < ActiveRecord::Base
  has_one :address, as: :addressable
  has_many :test_scores
  has_many :references
  has_many :essays
  has_many :goalpaths
  has_many :skills
  has_many :experiences
  has_many :schoools, through: :student_schools
  has_many :student_schools

  def full_name
    [first_name, last_name].join(' ')
  end
end
