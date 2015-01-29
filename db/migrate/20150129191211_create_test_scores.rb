class CreateTestScores < ActiveRecord::Migration
  def change
    create_table :test_scores do |t|
      t.string :name
      t.string :score
      t.string :date_taken

      t.timestamps null: false
    end
  end
end
