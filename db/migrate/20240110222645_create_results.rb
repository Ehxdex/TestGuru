class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :test, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: {to_table: :users, on_delete: :cascade}

      t.timestamps
    end
  end
end
