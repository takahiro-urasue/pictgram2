class AddSomeColumnsToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :textbox, :string
    add_column :topics, :pulldown, :string
    add_column :topics, :radiobutton, :string
    add_column :topics, :checkbox, :string
  end
end
