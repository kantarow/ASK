class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :slidable, :boolean, default: false, null: false
  end
end
