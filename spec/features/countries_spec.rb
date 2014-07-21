require 'spec_helper'

feature 'Countries and Continents' do

  scenario "User views a list of continents, and sees the countries in that continent" do
    visit '/'
    click_on 'Continents'
    click_on 'Africa'
    expect(page).to have_content("Kenya")
    expect(page).to have_content("South Africa")
    expect(page).to have_no_content("Venezuela")

  end

end