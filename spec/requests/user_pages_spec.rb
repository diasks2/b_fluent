require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: I18n.t(:signup)) }
    it { should have_selector('title', text: full_title(I18n.t(:signup))) }
  end
end