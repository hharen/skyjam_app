require 'test_helper'

class DaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day = days(:one)
  end

  test "should get index" do
    get days_url
    assert_response :success
  end

  test "should get new" do
    get new_day_url
    assert_response :success
  end

  test "should create day" do
    assert_difference('Day.count') do
      post days_url, params: { day: { assistant: @day.assistant, date: @day.date, instructor: @day.instructor, takeoff: @day.takeoff } }
    end

    assert_redirected_to day_url(Day.last)
  end

  test "should show day" do
    get day_url(@day)
    assert_response :success
  end

  test "should get edit" do
    get edit_day_url(@day)
    assert_response :success
  end

  test "should update day" do
    patch day_url(@day), params: { day: { assistant: @day.assistant, date: @day.date, instructor: @day.instructor, takeoff: @day.takeoff } }
    assert_redirected_to day_url(@day)
  end

  test "should destroy day" do
    assert_difference('Day.count', -1) do
      delete day_url(@day)
    end

    assert_redirected_to days_url
  end
end
