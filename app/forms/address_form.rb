module AddressForm
  include Reform::Form::Module

  property :address, populate_if_empty: Address do
    properties :street, :city, :state, :country, validates: { presence: true, length: { minimum: 2} }
    property :zip, validates: { presence: true, length: { minimum: 5 } }

    def country
      super || 'USA'
    end
  end
end