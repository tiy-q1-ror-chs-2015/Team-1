class ChangeContentToText < ActiveRecord::Migration
  def change
    change_column :references, :content, :text
  end
end
