class AddManyColumnsToSchools < ActiveRecord::Migration
  def change
    School.destroy_all
    remove_foreign_key :schools, :states
    remove_column :schools, :average_act
    remove_column :schools, :average_sat
    remove_column :schools, :comment
    remove_column :schools, :city
    remove_column :schools, :state_id
    add_reference :schools, :address, index: true
    add_column :schools, :number_of_applicants, :integer
    add_column :schools, :number_admitted, :integer
    add_column :schools, :number_admitted_enrolled, :integer
    add_column :schools, :percent_applicants_admitted, :decimal
    add_column :schools, :percent_applicants_enrolled, :decimal
    add_column :schools, :percentile_25_sat_verbal, :integer
    add_column :schools, :percentile_75_sat_verbal, :integer
    add_column :schools, :percentile_25_sat_math, :integer
    add_column :schools, :percentile_75_sat_math, :integer
    add_column :schools, :percentile_25_act_composite, :integer
    add_column :schools, :percentile_75_act_composite, :integer
    add_column :schools, :percentile_25_act_english, :integer
    add_column :schools, :percentile_75_act_english, :integer
    add_column :schools, :percentile_25_act_math, :integer
    add_column :schools, :percentile_75_act_math, :integer
    add_column :schools, :website, :string
  end
end
