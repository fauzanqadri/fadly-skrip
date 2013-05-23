class CreateNasabahs < ActiveRecord::Migration
  def change
    create_table :nasabahs do |t|
      t.string :nama_lengkap
      t.string :email
      t.string :tempat_lahir
      t.date :tanggal_lahir
      t.string :agama
      t.string :jenis_kelamin
      t.string :kewarganegaraan
      t.string :no_identitas
      t.string :jenis_identitas
      t.date :expire_identitas
      t.text :alamat_rumah
      t.text :alamat_surat
      t.string :status_pernikahan
      t.string :status_rumah_tinggal
      t.string :pekerjaan
      t.string :bidang_usaha
      t.string :no_tlp_kantor
      t.string :no_ponsel
      t.string :no_tlp_rumah
      t.string :no_faximile
      t.string :no_npwp
      t.string :nama_lengkap_ibu_kandung
      t.boolean :rekening_koran
      t.string :jenis_rekening
      t.string :tujuan_penggunaan_rekening
      t.string :tujuan_penggunaan_dana
      t.decimal :storan_awal
      t.decimal :current_saldo
      t.boolean :approved
      t.date :approved_at
      t.integer :actor_id
      t.timestamps
    end
  end
end
