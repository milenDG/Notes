class RenameNoteNotebooksIdColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :notes, :notebooks_id, :notebook_id
  end
end
