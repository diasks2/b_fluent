# -*- encoding : utf-8 -*-
class Toefli < ActiveRecord::Base
  attr_accessible :toefli_date, :toefli_l, :toefli_r, :toefli_s, :toefli_w
  belongs_to :user

  validates :toefli_date, presence: true, :date => { :before => Time.now }
  validates :toefli_l, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 30 }
  validates :toefli_r, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 30 }
  validates :toefli_s, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 30 }
  validates :toefli_w, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 30 }

  validates :user_id, presence: true
  default_scope order: 'toeflis.toefli_date ASC'
end
