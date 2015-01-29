class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name
      t.string :relation_to_student
      t.integer :date
      t.string :content

      t.timestamps null: false
    end
  end
end
