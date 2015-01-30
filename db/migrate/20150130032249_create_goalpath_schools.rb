class CreateGoalpathSchools < ActiveRecord::Migration
  def change
    create_table :goalpath_schools do |t|
      t.references :goalpath, index: true
      t.references :school, index: true
    end
    add_foreign_key :goalpath_schools, :goalpaths
    add_foreign_key :goalpath_schools, :schools
  end
end
