class StudentForm < Reform::Form

  include AddressForm

  properties :first_name, :last_name, validates: { presence: true }

  def address
    super || @model.build_address
  end
end