class Eiken < ActiveRecord::Base
  attr_accessible :eiken_result, :eiken_level, :eiken_date
  belongs_to :user

  validates :eiken_date, presence: true, :date => { :before => Time.now }
  validates :eiken_level, presence: true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 7 }
  validates :eiken_result, :inclusion => {:in => [true, false]}

  validates :user_id, presence: true
  default_scope order: 'eikens.eiken_date ASC'
end
