class Product < ActiveRecord::Base
  self.per_page = 10
  attr_accessible :code, :description, :first_credit, :month_credit, :month_period, :name, :version, :value
  validates :name, :presence => true
  validates :first_credit, :presence => true
  validates :month_credit, :presence => true
  validates :month_period, :presence => true
  validates :value, :presence => true
  validates :version, :uniqueness => true
  has_many :nasabahs
  has_many :out_version, :class_name => "Product", :foreign_key => "code", :primary_key => "code"
  before_create :set_default_version
  
  def clone_attr_for_upgrade
    as_json(only: [:name, :code, :description, :version])
  end
  
  def self.last_version_product
    self.select(:code).uniq.map do |p|
      product = self.where(:code => p.code).order("version desc").limit(1).first
      ["#{product.name} V.#{product.version}", product.id]
    end
  end
  
  private
  def set_default_version
    self.version = if !self.version.nil? || !self.version.blank?
       self.version += 1
    else
      1
    end
  end
  
end
