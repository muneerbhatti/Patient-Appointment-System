class CreatePerceptions < ActiveRecord::Migration[7.2]
  def change
    create_table :perceptions do |t|
      t.string :name
      t.string :type
      t.string :formula

      t.timestamps
    end
  end
end
