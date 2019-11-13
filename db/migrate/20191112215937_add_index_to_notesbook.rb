class AddIndexToNotesbook < ActiveRecord::Migration[5.2]
  def change
    add_index :notebooks, :title, unique: true
  end
end
