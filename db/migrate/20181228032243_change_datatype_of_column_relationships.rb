class ChangeDatatypeOfColumnRelationships < ActiveRecord::Migration[5.2]
  def change
    change_column :relationships, :following_id, :string
    change_column :relationships, :follower_id, :string
  end
end
