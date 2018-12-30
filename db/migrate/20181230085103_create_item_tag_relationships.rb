class CreateItemTagRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :item_tag_relationships do |t|
      t.integer :item_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :relationships, [:following, :follower], unique: true
  end
end
