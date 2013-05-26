class Nasabah < ActiveRecord::Base
  SEX = ["Pria", "Wanita"]
  JENIS_IDENTITAS = ["KTP", "SIM", "PASPOR"]
  STATUS_PERNIKAHAN = ["Menikah", "Belum Menikah", "Pernah Menikah"]
  AGAMA = ["Islam", "Kristen", "Katolik", "Hindu", "Budha"]
  attr_accessible :accomplished, :actor_id, :agama, :alamat_rumah, :alamat_surat, :approved, :approved_at, :biaya_administrasi, 
                  :bidang_usaha, :current_saldo, :email, :expire_identitas, :is_archive, :jenis_identitas, :jenis_kelamin, 
                  :kewarganegaraan, :key_storage_id, :nama_lengkap, :nama_lengkap_ibu_kandung, :no_faximile, :no_identitas, 
                  :no_npwp, :no_ponsel, :no_tlp_kantor, :no_tlp_rumah, :pekerjaan, :rekening_koran, :status_pernikahan, 
                  :status_rumah_tinggal, :sumber_dana, :tanggal_lahir, :tempat_lahir, :tujuan_penggunaan_dana, :tujuan_penggunaan_rekening
  
end
