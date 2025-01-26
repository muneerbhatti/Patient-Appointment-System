class AddColumnUser < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :userable, polymorphic: true, index: true
  end
end
