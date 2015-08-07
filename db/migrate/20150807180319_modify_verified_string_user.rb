class ModifyVerifiedStringUser < ActiveRecord::Migration
  def up
    remove_column :users, :verified, :boolean
    add_column :users, :verified, :string
  end
  
  def down
    remove_column :users, :verified, :string
    add_column :users, :verified, :boolean
  end
  
end
