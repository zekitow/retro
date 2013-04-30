class AddTimesBeingKeptToBad < ActiveRecord::Migration
  def change
    add_column :bads, :times_being_kept, :integer
  end
end
