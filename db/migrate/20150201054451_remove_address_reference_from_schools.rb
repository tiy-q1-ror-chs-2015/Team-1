class RemoveAddressReferenceFromSchools < ActiveRecord::Migration
  def change
    remove_reference :schools, :address
  end
end
