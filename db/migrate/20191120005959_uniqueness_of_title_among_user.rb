class UniquenessOfTitleAmongUser < ActiveRecord::Migration[5.2]
  def change
    remove_index :notes, :title
    remove_index :notebooks, :title
    remove_index :quick_notes, :title
    
    add_index :notebooks, [:title, :user_id], unique: true
    add_index :notes, [:title, :user_id], unique: true
    add_index :quick_notes, [:title, :user_id], unique: true
  end
end
