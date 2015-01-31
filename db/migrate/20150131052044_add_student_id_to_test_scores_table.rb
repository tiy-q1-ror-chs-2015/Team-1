class AddStudentIdToTestScoresTable < ActiveRecord::Migration
  def change
    add_reference :test_scores, :student, index: true
    add_foreign_key :test_scores, :students
  end
end
