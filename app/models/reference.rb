class Reference < ActiveRecord::Base
    belongs_to :student
    def full_name
      [first_name, last_name].join(' ')
    end
end
