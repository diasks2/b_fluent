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

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_selector('h1',    text: I18n.t(:update_profile)) }
      it { should have_selector('title', text: I18n.t(:settings)) }
      it { should have_link(I18n.t(:change), href: 'http://gravatar.com/emails') }
    end
  end
end
