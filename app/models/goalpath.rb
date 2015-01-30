class Goalpath < ActiveRecord::Base
    belongs_to :student
  has_many :schools, through: :goalpath_schools
  has_many :goalpath_schools
end
