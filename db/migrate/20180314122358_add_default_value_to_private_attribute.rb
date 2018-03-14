class AddDefaultValueToPrivateAttribute < ActiveRecord::Migration
  def up
    change_column :lists, :private, :boolean, default: true
  end

  def down
    change_column :lists, :private, :boolean, default: nil
  end
end
