require 'spec_helper'

feature 'Homepage' do
  scenario 'Shows the welcome message' do
    visit '/'

    expect(page).to have_content 'Welcome!'
    expect(page).to have_content 'Name:'
    expect(page).to have_button 'Add Message'
  end

  scenario 'add a message to homepage' do
    visit '/'
    fill_in 'Name:', with: 'rob'
    fill_in 'Message:', with: 'This will be the greatest site ever.'
    click_button 'Add Message'
    expect(page).to have_content 'This will be the greatest site ever.'
  end
end