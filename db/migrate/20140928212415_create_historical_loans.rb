class CreateHistoricalLoans < ActiveRecord::Migration
  def change
    create_table :historical_loans do |t|
      t.integer :old_loan_id
      t.integer :new_loan_id

      t.timestamps
    end
  end
end
