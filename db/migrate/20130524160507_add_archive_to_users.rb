class AddArchiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :archives, :boolean
  end
end
