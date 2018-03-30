class AddDefaultValueToCompletedAttribute < ActiveRecord::Migration
  def up
  change_column :items, :completed, :boolean, default: false
  end

  def down
    change_column :items, :completed, :boolean, default: nil
  end
end
