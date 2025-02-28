class AddStatusToTokens < ActiveRecord::Migration[7.2]
  def change
    add_column :tokens, :status, :integer
  end
end
