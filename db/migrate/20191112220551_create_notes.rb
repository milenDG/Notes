class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.string :subtitle
      t.text :content, null: false

      t.timestamps
    end

    add_reference :notes, :notebooks, index: true
    add_index :notes, :title, unique: true
  end
end
