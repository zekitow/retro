class AddColumnEnabledToRetrospectives < ActiveRecord::Migration
  def up
    add_column :retrospectives, :enabled, :boolean, :default => true
  end

  def down
    remove_column :retrospectives, :enabled
  end
end
