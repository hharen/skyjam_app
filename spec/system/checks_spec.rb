require 'rails_helper'

RSpec.describe "Checks", type: :system do
  before do
    driven_by(:rack_test)
  end

  xit "enables me to create a new check" do

    visit '/'
    click_button 'Checks'
    click_button 'New check'

    fill_in 'Glider type', :with => 'Wave'

    click_button 'Create check'

    expect(page).to have_text('Check successfully created.')
  end
end
