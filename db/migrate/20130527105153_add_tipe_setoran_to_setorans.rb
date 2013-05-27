class AddTipeSetoranToSetorans < ActiveRecord::Migration
  def change
    add_column :setorans, :tipe_setoran, :string
  end
end
