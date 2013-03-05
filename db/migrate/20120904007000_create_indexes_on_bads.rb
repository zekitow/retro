class CreateIndexesOnBads < ActiveRecord::Migration
  def change
    add_index :bads, :retrospective_id
  end
end
