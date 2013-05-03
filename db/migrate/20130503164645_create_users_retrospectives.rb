class CreateUsersRetrospectives < ActiveRecord::Migration
  def change
    create_table :users_retrospectives do |t|
      t.integer :user_id, :null => false
      t.integer :retrospective_id, :null => false
    end
  end
end
