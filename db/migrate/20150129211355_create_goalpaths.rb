class CreateGoalpaths < ActiveRecord::Migration
  def change
    create_table :goalpaths do |t|
      t.string :end_goal
      t.references :student
      t.timestamps null: false
    end
  end
end
