class CreateNotebooks < ActiveRecord::Migration[5.2]
  def change
    create_table :notebooks do |t|
      t.string :title, null: false
      t.string :subtitle
      t.text :description, null: false

      t.timestamps
    end


    add_reference :notebooks, :user, index: true
  end
end
