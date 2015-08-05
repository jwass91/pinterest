class CreatePin < ActiveRecord::Migration
  def up
    create_table :pins do |t|
      t.string :user
      t.string :image
      t.string :link
      t.string :description
      t.string :category
    end
  end
    
  def down
    drop_table :pins
  end
end
