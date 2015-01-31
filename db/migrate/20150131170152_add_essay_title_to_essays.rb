class AddEssayTitleToEssays < ActiveRecord::Migration
  def change
    add_column :essays, :essay_title, :string
  end
end
