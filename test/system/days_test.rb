require "application_system_test_case"

class DaysTest < ApplicationSystemTestCase
  setup do
    @day = days(:one)
  end

  test "visiting the index" do
    visit days_url
    assert_selector "h1", text: "Days"
  end

  test "creating a Day" do
    visit days_url
    click_on "New Day"

    fill_in "Assistant", with: @day.assistant
    fill_in "Date", with: @day.date
    fill_in "Instructor", with: @day.instructor
    fill_in "Takeoff", with: @day.takeoff
    click_on "Create Day"

    assert_text "Day was successfully created"
    click_on "Back"
  end

  test "updating a Day" do
    visit days_url
    click_on "Edit", match: :first

    fill_in "Assistant", with: @day.assistant
    fill_in "Date", with: @day.date
    fill_in "Instructor", with: @day.instructor
    fill_in "Takeoff", with: @day.takeoff
    click_on "Update Day"

    assert_text "Day was successfully updated"
    click_on "Back"
  end

  test "destroying a Day" do
    visit days_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Day was successfully destroyed"
  end
end
