class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  belongs_to :state

  def full_address array:false
    if array
      full_address_array
    else
      full_address_array.join('\n')
    end
  end

  def full_address_array
    [street, ("#{city}, #{state} #{zip}" if city), (state.country unless state.country == 'USA')].compact
  end
end
