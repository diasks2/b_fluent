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
      it { should have_link(I18n.t(:settings), href: edit_user_path(user)) }
      it { should have_link(I18n.t(:signout), href: signout_path) }
      it { should_not have_link(I18n.t(:signin), href: signin_path) }

      describe "followed by signout" do
        before { click_link I18n.t(:signout) }
        it { should have_link(I18n.t(:signin)) }
      end

    end
  end

  describe "authorization" do

    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }

      before { sign_in non_admin }

      describe "submitting a DELETE request to the Users#destroy action" do
        before { delete user_path(user) }
        specify { response.should redirect_to(root_path) }        
      end
    end

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: I18n.t(:signin)) }
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
      end
    end
 
   describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title(I18n.t(:update_profile))) }
      end

      describe "submitting a PUT request to the Users#update action" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end
  end
end
