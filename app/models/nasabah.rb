class Nasabah < ActiveRecord::Base
  attr_accessible :actor_id, :agama, :alamat_rumah, :alamat_surat, :approved, :approved_at, :bidang_usaha, :current_saldo, :email, :expire_identitas, :jenis_identitas, :jenis_kelamin, :jenis_rekening, :kewarganegaraan, :nama_lengkap, :nama_lengkap_ibu_kandung, :no_faximile, :no_identitas, :no_npwp, :no_ponsel, :no_tlp_kantor, :no_tlp_rumah, :pekerjaan, :rekening_koran, :status_pernikahan, :status_rumah_tinggal, :storan_awal, :tanggal_lahir, :tempat_lahir, :tujuan_penggunaan_dana, :tujuan_penggunaan_rekening
end
