class State < ActiveRecord::Base
  def to_s
    abbreviation
  end
end
