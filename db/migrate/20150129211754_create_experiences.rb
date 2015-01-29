class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :description
      t.references :student
      t.timestamps null: false
    end
  end
end
