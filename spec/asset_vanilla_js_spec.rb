require 'rails_helper'

describe 'asset_vanilla_js', :type => :feature do
  it 'loads and runs the transpiled JS from assets in js', :js => true do
    visit asset_vanilla_js_example_index_path
    expect(page).to have_text "Asset vanilla JS"
    expect(page.driver.console_messages.map {|m| m[:message]}).to include "Asset vanilla JS ready"
    click_link 'Execute asset.js'
    expect(page).to have_text "Fibonacci sequence:"
    sleep 2.seconds
    expect(page).to have_text "Fibonacci sequence: 0, 1,"
    expect(page.driver.error_messages).to eq []
  end

  it 'loads and runs the transpiled JS from inline ERB in js', :js => true do
    visit inline_vanilla_js_example_index_path
    expect(page).to have_text "Inline vanilla JS with ERB"
    expect(page.driver.console_messages.map {|m| m[:message]}).to include "Inline vanilla .js ready"
    expect(page).to have_text "Fibonacci sequence on inline js:"
    sleep 2.seconds
    expect(page).to have_text "Fibonacci sequence on inline js: 0, 1,"
    expect(page.driver.error_messages).to eq []
  end

  it 'loads and runs the transpiled es6 from a remote .JS view template in js', :js => true do
    visit remote_vanilla_js_example_index_path
    expect(page).to have_text "Remote vanilla JS"
    click_link 'Execute remote3.js'
    sleep 2.seconds
    expect(page.driver.console_messages.map {|m| m[:message]}).to include "Remote vanilla .js ready."
    expect(page).to have_text "Fibonacci sequence on .js:"
    sleep 2.seconds
    expect(page).to have_text "Fibonacci sequence on .js: 0, 1,"
    expect(page.driver.error_messages).to eq []
  end
end
