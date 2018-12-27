class CreateNames < ActiveRecord::Migration[5.2]
  def change
    create_table :names do |t|
      t.decimal :pricing
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
