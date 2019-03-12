class CreateFollowTagRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_tag_relationships do |t|
      t.string  :user_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
