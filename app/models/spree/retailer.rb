# Status: Copied, not tested.
module Spree
  class Retailer < ActiveRecord::Base
    belongs_to :payment_method
    belongs_to :physical_address, :foreign_key => "physical_address_id", :class_name => "Spree::Address"
    belongs_to :mailing_address, :foreign_key => "mailing_address_id", :class_name => "Spree::Address"
  
    accepts_nested_attributes_for :physical_address, :reject_if => :all_blank
    accepts_nested_attributes_for :mailing_address, :reject_if => :all_blank
  
    has_and_belongs_to_many :orders, :join_table => :spree_retailers_orders
    has_and_belongs_to_many :users, :join_table => :spree_retailers_users
    has_and_belongs_to_many :tax_rates, :join_table => :spree_retailers_tax_rates
  
    validates :name, :payment_method, :phone, :presence => true
  
    has_attached_file :logo,
                      :styles => { :mini => '48x48>', :thumb => '240x240>' },
                      :default_style => :thumb,
                      :url => "/system/retailers/:attachment/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/system/retailers/:attachment/:id/:style/:basename.:extension"

  	state_machine :initial => 'new' do
      event :activate do
        transition :from => ['new', 'suspended'], :to => 'active'
      end
      event :suspend do
        transition :from => ['new', 'active'], :to => 'suspended'
      end
    end
  
    # get the fedex credentials
    def shipping_config
      if Rails.env == "production"
        {:key => fedex_key, :password => fedex_password, :account => fedex_account, :login => fedex_meter }
      else
        {:key => fedex_key, :password => fedex_password, :account => fedex_account, :login => fedex_meter, :test => true }
      end
    end

  end
end