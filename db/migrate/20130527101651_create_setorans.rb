class CreateSetorans < ActiveRecord::Migration
  def change
    create_table :setorans do |t|
      t.integer :nasabah_id
      t.string :actor_id
      t.integer :amount
      t.integer :term
      t.integer :credit
      t.integer :debit
      t.integer :saldo
      t.string :keterangan

      t.timestamps
    end
  end
end
