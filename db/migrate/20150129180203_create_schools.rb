class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :application_deadline
      t.integer :average_sat
      t.integer :average_act
      t.string :school_name
      t.integer :student_population
      t.string :city
      t.string :state
      t.string :comment

      t.timestamps null: false
    end
  end
end
