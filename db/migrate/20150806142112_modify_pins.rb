class ModifyPins < ActiveRecord::Migration
  def up
    remove_column :pins, :user
    add_column :pins, :user_id, :integer
  end
  
  def down
    add_column :pins, :user, :string
    remove_column :pins, :user_id, :integer
  end
end
