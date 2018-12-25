class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :title
      t.text :content
      t.references :user_id

      t.timestamps
    end
  end
end
