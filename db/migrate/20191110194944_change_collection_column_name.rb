class ChangeCollectionColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :collections, :topic, :description
  end
end
