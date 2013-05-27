class LaporanController < ApplicationController
  layout "print"
  def nasabah
    @nasabahs = Nasabah.all
  end
  
  def get_nasabah_by_product
    @nasabahs = Nasabah.where(:product_id => params[:scope][:product])
  end
  
  def setoran
    @setorans = Setoran.all if params[:scope].nil? || params[:scope].blank?
    @setorans = Setoran.get_by_time(params[:scope]) unless params[:scope].nil? || params[:scope].blank?
  end
  
  def get_setoran_by_range
    @setorans = Setoran.all if params[:scope].nil? || params[:scope].blank?
    @setorans = Setoran.get_by_range(params[:scope])
  end
end
