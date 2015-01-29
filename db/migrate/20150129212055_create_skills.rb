class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :skill_name
      t.text :description
      t.references :student
      t.timestamps null: false
    end
  end
end
