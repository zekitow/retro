class CreateIndexesOnRetrospective < ActiveRecord::Migration
  def change
    add_index :retrospectives, :user_id
  end
end
