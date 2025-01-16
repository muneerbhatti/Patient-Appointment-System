class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.integer :payment_type ,default:0
      t.string :detail
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
