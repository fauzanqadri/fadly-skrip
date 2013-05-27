class RenameKeyStorageIdToProductIdOnNasabahs < ActiveRecord::Migration
  def change
    rename_column :nasabahs, :key_storage_id, :product_id
  end
end
