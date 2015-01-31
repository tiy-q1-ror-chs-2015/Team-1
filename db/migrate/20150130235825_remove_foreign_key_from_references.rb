class RemoveForeignKeyFromReferences < ActiveRecord::Migration
  def change
    remove_foreign_key :references, :students
  end
end
