# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',    text: I18n.t(:signin)) }
    it { should have_selector('title', text: I18n.t(:signin)) }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button I18n.t(:signin) }

      it { should have_selector('title', text: I18n.t(:signin)) }
      it { should have_selector('div.alert.alert-error', text: I18n.t(:invalidemail)) }
    end

  describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button I18n.t(:signin)
      end

      it { should have_selector('title', text: user.name) }
      it { should have_link(I18n.t(:profile), href: user_path(user)) }
      it { should have_link(I18n.t(:signout), href: signout_path) }
      it { should_not have_link(I18n.t(:signin), href: signin_path) }

      describe "followed by signout" do
        before { click_link I18n.t(:signout) }
        it { should have_link(I18n.t(:signin)) }
      end

    end
  end
end
