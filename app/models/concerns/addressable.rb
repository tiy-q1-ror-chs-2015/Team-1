module Addressable
  extend ActiveSupport::Concern

  included do
    has_one :address, as: :addressable, dependent: :destroy
    delegate :street, :city, :state, :zip, :country, to: :address
    delegate :full_address, :full_address_array, to: :address
  end
end