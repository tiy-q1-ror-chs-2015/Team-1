class ChangeDateToDateTypeInReferences < ActiveRecord::Migration
  def change
    change_column :references, :date, :date
  end
end
