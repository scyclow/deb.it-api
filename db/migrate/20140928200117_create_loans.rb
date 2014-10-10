class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :creditor_id
      t.integer :debtor_id
      t.decimal :amount
      t.string  :description
      t.boolean :closed, default: false
      t.boolean :private_debt, default: false


      t.timestamps
    end
  end
end
