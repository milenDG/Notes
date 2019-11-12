class DropNotesAndCollectionTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :notes
    drop_table :collections
  end
end
