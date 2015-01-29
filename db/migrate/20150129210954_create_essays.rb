class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.string :topic
      t.text :content
      t.timestamps null: false
      t.references :student 
    end
  end
end
