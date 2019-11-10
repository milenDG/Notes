class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.belongs_to :user, null: false
      t.string :name, null: false
      t.string :topic, null: false
      t.timestamps
    end
  end
end
