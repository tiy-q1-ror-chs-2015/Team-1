class Student < ActiveRecord::Base

  include Addressable

  belongs_to :user
  has_many :test_scores
  has_many :references
  has_many :essays
  has_many :goalpaths
  has_many :skills
  has_many :experiences
  has_many :schools, through: :student_schools
  has_many :student_schools, dependent: :destroy

  def full_name
    [first_name, last_name].join(' ')
  end

  # Returns a list of schools and the goals they are associated with.
  def goal_schools
    goalpaths.inject(Hash.new { Array.new }) do |hsh, goalpath|
      goalpath.schools.each do |school|
        hsh[school] = hsh[school] << goalpath
      end
      hsh
    end
  end
end
