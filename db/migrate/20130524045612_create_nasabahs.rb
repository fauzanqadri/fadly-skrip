class CreateNasabahs < ActiveRecord::Migration
  def change
    create_table :nasabahs do |t|
      t.string :nama_lengkap
      t.string :tempat_lahir
      t.date :tanggal_lahir
      t.string :jenis_kelamin
      t.string :kewarganegaraan
      t.string :no_identitas
      t.string :jenis_identitas
      t.date :expire_identitas
      t.string :no_npwp
      t.text :alamat_rumah
      t.text :alamat_surat
      t.string :no_tlp_kantor
      t.string :no_ponsel
      t.string :no_faximile
      t.string :email
      t.boolean :rekening_koran
      t.string :status_pernikahan
      t.string :status_rumah_tinggal
      t.string :no_tlp_rumah
      t.string :pekerjaan
      t.string :bidang_usaha
      t.string :sumber_dana
      t.string :tujuan_penggunaan_rekening
      t.string :tujuan_penggunaan_dana
      t.decimal :biaya_administrasi
      t.string :nama_lengkap_ibu_kandung
      t.string :agama
      t.decimal :current_saldo
      t.boolean :approved
      t.boolean :accomplished
      t.date :approved_at
      t.integer :actor_id
      t.integer :key_storage_id
      t.boolean :is_archive

      t.timestamps
    end
  end
end
