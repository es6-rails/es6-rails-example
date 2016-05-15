require 'rails_helper'

describe 'asset_vanilla_es6', :type => :feature do

  it 'loads and runs the transpiled es6 from assets in js', :js => true do
    visit asset_vanilla_es6_example_index_path
    expect(page).to have_text "Asset vanilla ES6"
    click_link 'Execute asset.es6'
    # sleep 2.seconds
    expect(page).to have_text "Fibonacci sequence:"
    sleep 2.seconds
    expect(page).to have_text "Fibonacci sequence: 0, 1,"
  end
end
