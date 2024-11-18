class AddColumnUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :user_id,:integer
    add_column :users, :user_type, :string
  end
end
