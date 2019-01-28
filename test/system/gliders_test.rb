require "application_system_test_case"

class GlidersTest < ApplicationSystemTestCase
  setup do
    @glider = gliders(:one)
  end

  test "visiting the index" do
    visit gliders_url
    assert_selector "h1", text: "Gliders"
  end

  test "creating a Glider" do
    visit gliders_url
    click_on "New Glider"

    fill_in "Color Name", with: @glider.color_name
    fill_in "Image", with: @glider.image
    fill_in "Manufacturer", with: @glider.manufacturer
    fill_in "Serial Number", with: @glider.serial_number
    fill_in "Size", with: @glider.size
    fill_in "Type", with: @glider.type
    fill_in "Year Manufactured", with: @glider.year_manufactured
    click_on "Create Glider"

    assert_text "Glider was successfully created"
    click_on "Back"
  end

  test "updating a Glider" do
    visit gliders_url
    click_on "Edit", match: :first

    fill_in "Color Name", with: @glider.color_name
    fill_in "Image", with: @glider.image
    fill_in "Manufacturer", with: @glider.manufacturer
    fill_in "Serial Number", with: @glider.serial_number
    fill_in "Size", with: @glider.size
    fill_in "Type", with: @glider.type
    fill_in "Year Manufactured", with: @glider.year_manufactured
    click_on "Update Glider"

    assert_text "Glider was successfully updated"
    click_on "Back"
  end

  test "destroying a Glider" do
    visit gliders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Glider was successfully destroyed"
  end
end
