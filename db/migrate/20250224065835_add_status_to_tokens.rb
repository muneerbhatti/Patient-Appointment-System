class AddStatusToTokens < ActiveRecord::Migration[7.2]
  def change
    add_column :tokens, :status, :integer, default:0
  end
end
