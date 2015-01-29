class RemoveCityStateAndZipFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :city
    remove_column :students, :state
    remove_column :students, :zip
  end
end
