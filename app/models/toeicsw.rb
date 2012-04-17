# -*- encoding : utf-8 -*-
class Toeicsw < ActiveRecord::Base
  attr_accessible :toeicsw_date, :toeicsw_s, :toeicsw_w
  belongs_to :user

  validates :toeicsw_date, presence: true, :date => { :before => Time.now }
  validates :toeicsw_s, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 200 }
  validates :toeicsw_w, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 200 }

  validates :user_id, presence: true
  default_scope order: 'toeicsws.toeicsw_date ASC'

end
