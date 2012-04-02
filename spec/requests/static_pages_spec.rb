# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', text: I18n.t(:welcome)) }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| I18n.t(:home)' }
  end

  describe "Pricing page" do
    before { visit pricing_path }

    it { should have_selector('h1',    text: I18n.t(:pricing)) }
    it { should have_selector('title', text: full_title(I18n.t(:pricing))) }
  end

   describe "Principles page" do
    before { visit principles_path }

    it { should have_selector('h1',    text: I18n.t(:principles)) }
    it { should have_selector('title', text: full_title(I18n.t(:principles))) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: I18n.t(:about)) }
    it { should have_selector('title', text: full_title(I18n.t(:about))) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1',    text: I18n.t(:contact)) }
    it { should have_selector('title', text: full_title(I18n.t(:contact))) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link I18n.t(:about)
    page.should have_selector 'title', text: full_title(I18n.t(:about))
    click_link I18n.t(:contact)
    page.should have_selector 'title', text: full_title(I18n.t(:contact))
  end
end
