class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.string :rule, null: false
      t.string :criteria, null: false

      t.timestamps
    end
  end
end
