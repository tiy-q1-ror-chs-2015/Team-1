require 'ostruct'

module AddressForm
  include Reform::Form::Module

  property :address, populate_if_empty: Address do
    properties :street, :city, validates: { presence: true, length: { minimum: 2} }
    property :zip, validates: { presence: true, length: { minimum: 5 } }

    class StateByAbbreviation < Virtus::Attribute
      # "1" => State
      def coerce(value)
        State.find_by(abbreviation: value)
      end
    end

    property :state_id

    def state_id
      super || nil
    end

    def state_id= state
      State.find_by(abbreviation: state).id
    end

  end
end