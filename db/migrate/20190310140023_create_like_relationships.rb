class CreateLikeRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :like_relationships do |t|
      t.string :user_id
      t.integer :item_id

      t.timestamps
    end
    add_index :like_relationships, [:user_id, :item_id], unique: true
  end
end
