class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, index: true
      t.integer :following_id, index: true

      t.timestamps
    end
    add_index :relationships, [:following, :follower], unique: true
  end
end
