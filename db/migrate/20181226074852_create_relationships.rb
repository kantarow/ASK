class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :follower, class_name: "User", foreign_key: true
      t.references :following, class_name: "User", foreign_key: true

      t.timestamps
    end
  end
end
