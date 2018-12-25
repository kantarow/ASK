class AddItemsToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :user_id, index: true
  end
end
