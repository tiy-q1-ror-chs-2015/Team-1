class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbreviation
      t.string :classification
      t.integer :sort
      t.string :country

      t.timestamps null: false
    end

    Rake::Task['create_states'].invoke

    rename_column :addresses, :state, :old_state
    add_column :addresses, :state_id, :integer, index: true
    add_foreign_key :addresses, :states

    Address.all.each do |address|
      address.state_id = State.find_by(name: address.old_state).id rescue nil
      address.save!
    end

    remove_column :addresses, :old_state
  end
end
