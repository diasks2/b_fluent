# -*- encoding : utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
BFluent::Application.initialize!

Time::DATE_FORMATS[:j_date] = "%Y年%m月%d日"
