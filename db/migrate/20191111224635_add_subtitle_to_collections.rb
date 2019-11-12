class AddSubtitleToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :subtitle, :string
  end
end
