require 'rails_helper'

feature "Admin panel" do
  scenario "viewing admin panel" do
    visit "/"

    expect(page).to have_content("Admin Panel")
  end
end
