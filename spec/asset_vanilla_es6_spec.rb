require 'rails_helper'

describe 'asset_vanilla_es6', :type => :feature do
  it 'loads and runs the transpiled es6 from assets in js', :js => true do
    visit asset_vanilla_es6_example_index_path
    expect(page).to have_text "Asset vanilla ES6"
    expect(page.driver.console_messages.map {|m| m[:message]}).to include "Asset vanilla ES6 ready"
    click_link 'Execute asset.es6'
    expect(page).to have_text "Fibonacci sequence:"
    sleep 2.seconds
    expect(page).to have_text "Fibonacci sequence: 0, 1,"
    expect(page.driver.error_messages).to eq []
  end

  it 'loads and runs the transpiled es6 from inline ERB in js', :js => true do
    visit inline_vanilla_es6_example_index_path
    expect(page).to have_text "Inline vanilla ES6 with ERB"
    expect(page.driver.console_messages.map {|m| m[:message]}).to include "Inline vanilla ES6 ready"
    expect(page).to have_text "Fibonacci sequence:"
    sleep 2.seconds
    expect(page).to have_text "Fibonacci sequence: 0, 1,"
    expect(page.driver.error_messages).to eq []
  end

  it 'loads and runs the transpiled es6 from a remote .es6 view template in js', :js => true do
    visit remote_vanilla_es6_example_index_path
    expect(page).to have_text "Remote vanilla ES6"
    click_link 'Execute remote.js.es6'
    sleep 2.seconds
    expect(page.driver.console_messages.map {|m| m[:message]}).to include "Remote vanilla ES6 ready"
    expect(page).to have_text "Fibonacci sequence on .es6:"
    sleep 2.seconds
    expect(page).to have_text "Fibonacci sequence on .es6: 0, 1,"
    expect(page.driver.error_messages).to eq []
  end
end
