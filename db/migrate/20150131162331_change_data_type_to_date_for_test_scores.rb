class ChangeDataTypeToDateForTestScores < ActiveRecord::Migration
  def change
    change_column :test_scores, :date_taken, :date
  end
end
