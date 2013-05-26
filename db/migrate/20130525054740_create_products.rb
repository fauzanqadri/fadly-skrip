class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :version
      t.text :description
      t.integer :month_period
      t.integer :month_credit
      t.integer :first_credit
      t.string :code

      t.timestamps
    end
  end
end
