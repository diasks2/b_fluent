# -*- encoding : utf-8 -*-
class Ielt < ActiveRecord::Base
  attr_accessible :ielt_date, :ielt_score
  belongs_to :user

  validates :ielt_date, presence: true, :date => { :before => Time.now }
  validates :ielt_score, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 9 }

  validates :user_id, presence: true
  default_scope order: 'ielts.ielt_date ASC'

end
