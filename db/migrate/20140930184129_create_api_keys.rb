class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.integer :user_id, null: false
      t.string  :token, 	null: false
      t.boolean :active, 	null: false, default: true

      t.timestamps
    end

    add_index :api_keys, ["user_id"], name: "index_api_keys_on_user_id", unique: false
    add_index :api_keys, ["token"], name: "index_api_keys_on_token", unique: false
  end
end
