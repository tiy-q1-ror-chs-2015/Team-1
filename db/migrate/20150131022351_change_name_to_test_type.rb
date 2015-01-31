class ChangeNameToTestType < ActiveRecord::Migration
  def change
    remove_column :test_scores, :name, :string
    add_column :test_scores, :test_type, :string
  end
end
