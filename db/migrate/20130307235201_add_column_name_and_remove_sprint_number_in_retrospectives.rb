class AddColumnNameAndRemoveSprintNumberInRetrospectives < ActiveRecord::Migration
  def up
    add_column :retrospectives, :name, :string, null: false
    execute "UPDATE retrospectives r SET r.name = CONCAT('sprint# ', r.sprint_number)"
    remove_column :retrospectives, :sprint_number
  end

  def down
    add_column :retrospectives, :sprint_number, :integer
    execute 'UPDATE retrospectives r SET r.sprint_number = r.id'
    remove_column :retrospectives, :name
  end
end
