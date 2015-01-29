class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :test_type
      t.string :score
      t.date :date_taken
      t.references :student, index: true

      t.timestamps null: false
    end
    add_foreign_key :tests, :students
  end
end
