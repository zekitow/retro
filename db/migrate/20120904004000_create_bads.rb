class CreateBads < ActiveRecord::Migration
  def change
    create_table :bads do |t|
      t.string :description
      t.string :action
      t.boolean :solved, :default => 0

      t.timestamps
      t.references :retrospective, :null => false
    end
  end
end
