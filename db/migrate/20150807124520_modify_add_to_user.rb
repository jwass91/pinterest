class ModifyAddToUser < ActiveRecord::Migration
  def up
    add_column :users, :password, :string
  end
  def down
    remove_column :users, :password
  end
end
