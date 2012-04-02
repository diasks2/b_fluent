# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: I18n.t(:signup)) }
    it { should have_selector('title', text: full_title(I18n.t(:signup))) }
  end

  describe "signup" do

    before { visit signup_path }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button I18n.t(:free_trial_start) }.not_to change(User, :count)
      end
    end
  end
end
