class Bridge < ActiveRecord::Base
  attr_accessible :bridge_date, :bridge_l, :bridge_r
  belongs_to :user

  validates :bridge_date, presence: true, :date => { :before => Time.now }
  validates :bridge_l, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 10, :less_than_or_equal_to => 90 }
  validates :bridge_r, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 10, :less_than_or_equal_to => 90 }

  validates :user_id, presence: true
  default_scope order: 'bridges.bridge_date ASC'
end
