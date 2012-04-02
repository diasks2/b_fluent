class Toeictest < ActiveRecord::Base
  attr_accessible :l_score, :r_score, :t_date
  belongs_to :user

  validates :t_date, presence: true, :date => { :before => Time.now }
  validates :l_score, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 5, :less_than_or_equal_to => 495 }
  validates :r_score, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 5, :less_than_or_equal_to => 495 }

  validates :user_id, presence: true
  default_scope order: 'toeictests.t_date DESC'
end
