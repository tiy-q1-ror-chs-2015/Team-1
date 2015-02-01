class School < ActiveRecord::Base

  include Addressable

  has_many :students, through: :student_schools
  has_many :student_schools, dependent: :destroy

  has_many :goalpaths, through: :goalpath_schools
  has_many :goalpath_schools, dependent: :destroy

  searchable do
    text :school_name
  end

  def average_sat_components
    [[percentile_25_sat_verbal, percentile_25_sat_math].compact.inject(:+), [percentile_75_sat_verbal, percentile_75_sat_math].compact.inject(:+)]
  end

  def average_act_components
    [percentile_25_act_composite, percentile_75_act_composite]
  end
end
