class ModifyUser < ActiveRecord::Migration
  def up
    remove_column :users, :usernmae
    add_column :users, :username, :string
  end
  def down
    remove_column :users, :username
    add_column :users, :usernmae, :string
  end
end
