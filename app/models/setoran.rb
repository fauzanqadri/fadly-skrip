class Setoran < ActiveRecord::Base
  JENIS_SETORAN = ["Debit", "Credit"]
  attr_accessible :actor_id, :amount, :credit, :debit, :keterangan, :nasabah_id, :term, :tipe_setoran
  validates :amount, :presence => true
  validates :tipe_setoran, :presence => true
  belongs_to :nasabah
  belongs_to :actor, :class_name => "User", :foreign_key => "actor_id", :primary_key => "id"
  before_create :dont_allow_debit
  #before_create :validate_completeness
  before_create :set_debit_credit
  before_create :set_saldo
  
  def self.get_by_time times
    self.where(:created_at => ("#{Chronic.parse(times)}".to_time)..(Chronic.parse("today")))
  end
  
  def self.get_by_range params
    self.where(:created_at => ("#{params[:date_form]} 00:00:00.000000".to_time)..("#{params[:date_to]} 00:00:00.000000".to_time))
  end
  
  def self.build_setoran params
    puts params
    product = Nasabah.find(params["nasabah_id"]).product
    time = product.value / params["amount"].to_i
    time.times do |ti|
      item = self.new params
      item.amount = params["amount"].to_i/time
      item.save
    end
  end
  
  private
  def set_debit_credit
    self.credit = self.amount if self.tipe_setoran == "Credit"
    self.debit = self.amount if self.tipe_setoran == "Debit"
  end
  
  def set_saldo
    nasabah = self.nasabah
    if self.tipe_setoran == "Credit"
      nasabah.current_saldo += self.amount unless nasabah.current_saldo.nil? || nasabah.current_saldo.blank?
      nasabah.current_saldo = self.amount if nasabah.current_saldo.nil? || nasabah.current_saldo.blank?
      self.saldo = nasabah.current_saldo
    else
      nasabah.current_saldo -= self.amount if nasabah.current_saldo >= 0
      self.saldo = nasabah.current_saldo
    end
    nasabah.save
  end
  
  def dont_allow_debit
    if self.tipe_setoran == "Debit"
      nasabah = self.nasabah
      if nasabah.current_saldo.nil? || nasabah.current_saldo.blank?
        errors.add(:saldo, "anda Tidak mencukupi")
        return false
      elsif nasabah.current_saldo == 0 ||  self.amount >  nasabah.current_saldo
        errors.add(:saldo, "anda Tidak mencukupi")
        return false
      end
    end
  end
  
  def validate_completeness
    multiple = self.amount*self.nasabah.product.month_period
    puts multiple
    if self.nasabah.current_saldo == self.nasabah.product.value
      errors.add(:amount, "already completed product months period")
      return false
    elsif (self.amount > self.nasabah.product.value) or (self.amount < self.nasabah.product.month_credit) or self.nasabah.product.value%self.amount != 0 or (self.nasabah.product.value%self.amount == 0 && multiple > self.nasabah.product.value)
      errors.add(:amount, "amount must bea equal to #{self.nasabah.product.month_credit} or it's multiple")
      return false
    end    
  end
  
end
