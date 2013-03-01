class CreateRetrospectives < ActiveRecord::Migration
  def change
    create_table :retrospectives do |t|
      t.integer :sprint_number

      t.timestamps
      t.references :user, :null => false
    end
  end
end
