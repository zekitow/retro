class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :description

      t.timestamps
      t.references :retrospective, :null => false
    end
  end
end
