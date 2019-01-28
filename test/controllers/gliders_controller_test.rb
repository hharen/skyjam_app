require 'test_helper'

class GlidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @glider = gliders(:one)
  end

  test "should get index" do
    get gliders_url
    assert_response :success
  end

  test "should get new" do
    get new_glider_url
    assert_response :success
  end

  test "should create glider" do
    assert_difference('Glider.count') do
      post gliders_url, params: { glider: { color_name: @glider.color_name, image: @glider.image, manufacturer: @glider.manufacturer, serial_number: @glider.serial_number, size: @glider.size, type: @glider.type, year_manufactured: @glider.year_manufactured } }
    end

    assert_redirected_to glider_url(Glider.last)
  end

  test "should show glider" do
    get glider_url(@glider)
    assert_response :success
  end

  test "should get edit" do
    get edit_glider_url(@glider)
    assert_response :success
  end

  test "should update glider" do
    patch glider_url(@glider), params: { glider: { color_name: @glider.color_name, image: @glider.image, manufacturer: @glider.manufacturer, serial_number: @glider.serial_number, size: @glider.size, type: @glider.type, year_manufactured: @glider.year_manufactured } }
    assert_redirected_to glider_url(@glider)
  end

  test "should destroy glider" do
    assert_difference('Glider.count', -1) do
      delete glider_url(@glider)
    end

    assert_redirected_to gliders_url
  end
end
