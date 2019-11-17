class CreateQuickNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quick_notes do |t|
      t.string :title, null: false
      t.string :subtitle
      t.text :content, null: false

      t.timestamps
    end

    add_reference :quick_notes, :users, index: true
    add_index :quick_notes, :title, unique: true
  end
end
