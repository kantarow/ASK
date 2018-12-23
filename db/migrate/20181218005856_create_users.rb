class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: false do |t|
      t.string :id_name
      t.string :screen_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
