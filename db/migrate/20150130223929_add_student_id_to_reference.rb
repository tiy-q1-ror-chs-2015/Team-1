class AddStudentIdToReference < ActiveRecord::Migration
  def change
    add_reference :references, :student, index: true
    add_foreign_key :references, :students
  end
end
