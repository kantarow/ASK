class AddDefaultToUser < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :id, false
  end
end
