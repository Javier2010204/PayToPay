class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :pricing, scale: 2, precision: 10
      t.attachment :avatar
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
