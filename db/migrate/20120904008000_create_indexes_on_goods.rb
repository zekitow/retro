class CreateIndexesOnGoods < ActiveRecord::Migration
  def change
    add_index :goods, :retrospective_id
  end
end
