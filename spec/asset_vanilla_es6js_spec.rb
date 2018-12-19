require 'rails_helper'

describe 'asset_vanilla_es6_js', :type => :feature do
  it 'loads and runs the transpiled .es6.js from assets in js', :js => true do
    visit asset_vanilla_es6_js_example_index_path
    expect(page).to have_text "Asset vanilla ES6.JS"
    expect(page.driver.console_messages.map {|m| m[:message]}).to include "Asset vanilla ES6 JS ready"
    click_link 'Execute asset.es6.js'
    expect(page).to have_text "Fibonacci sequence:"
    sleep 2.seconds
    expect(page).to have_text "Fibonacci sequence: 0, 1,"
    expect(page.driver.error_messages).to eq []
  end
end
