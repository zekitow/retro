class AddColumnVotesToGoodAndBad < ActiveRecord::Migration
  def up
    add_column :goods, :votes, :integer, :default => 0
    add_column :bads,  :votes, :integer, :default => 0
  end

  def down
    remove_column :goods, :votes
    remove_column :bads,  :votes
  end

end
