class ChangeQuickNotesUserIdColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :quick_notes, :users_id, :user_id

    change_column :notebooks, :user_id, :integer, null: false
    change_column :mails, :user_id, :integer, null: false
    change_column :quick_notes, :user_id, :integer, null: false
  end
end
