class Product < ActiveRecord::Base
  attr_accessible :code, :description, :first_credit, :month_credit, :month_period, :name, :version, :value
  before_create :set_default_version
  
  def self.upgrade id
    item = self.find id
    
    # item1 = self.new item
    # item1.version += 1
    # item1
    item
  end
  
  private
  def set_default_version
    self.version = 1
  end
  
end
