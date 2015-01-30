class LinkSchoolsToStates < ActiveRecord::Migration
  def change
    rename_column :schools, :state, :old_state
    add_column :schools, :state_id, :integer, index: true
    add_foreign_key :schools, :states

    School.all.each do |school|
      school.state_id = State.find_by(name: school.old_state).id rescue nil
      school.save!
    end

    remove_column :schools, :old_state
  end
end
