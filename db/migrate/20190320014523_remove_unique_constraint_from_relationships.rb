class RemoveUniqueConstraintFromRelationships < ActiveRecord::Migration[5.2]
  def change
    remove_index :relationships, name: "index_relationships_on_following_and_follower"
  end
end
