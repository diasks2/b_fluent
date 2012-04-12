# -*- encoding : utf-8 -*-
class Casec < ActiveRecord::Base
  attr_accessible :c_date, :c_four, :c_one, :c_three, :c_two
  belongs_to :user

  validates :c_date, presence: true, :date => { :before => Time.now }
  validates :c_one, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 250 }
  validates :c_two, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 250 }
  validates :c_three, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 250 }
  validates :c_four, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 250 }

  validates :user_id, presence: true
  default_scope order: 'casecs.c_date ASC'
end
