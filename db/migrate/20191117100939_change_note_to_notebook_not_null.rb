class ChangeNoteToNotebookNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :notes, :notebooks_id, :integer, null: false
  end
end
