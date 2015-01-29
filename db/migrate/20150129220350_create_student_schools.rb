class CreateStudentSchools < ActiveRecord::Migration
  def change
    create_table :student_schools do |t|
      t.references :student, index: true
      t.references :school, index: true
      t.string :relationship

      t.timestamps null: false
    end
    add_foreign_key :student_schools, :students
    add_foreign_key :student_schools, :schools
  end
end
