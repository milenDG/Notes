class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.belongs_to :collection, null: false
      t.string :name, null: false
      t.string :topic
      t.text :text, null: false

      t.timestamps
    end
  end
end
