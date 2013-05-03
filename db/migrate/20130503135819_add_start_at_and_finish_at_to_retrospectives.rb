class AddStartAtAndFinishAtToRetrospectives < ActiveRecord::Migration
  def change
    add_column :retrospectives, :start_at, :date
    add_column :retrospectives, :finish_at, :date
  end
end
