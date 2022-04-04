require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { building_type: @quote.building_type, max_of_occupants_per_floor: @quote.max_of_occupants_per_floor, no_of_apartments: @quote.no_of_apartments, no_of_basements: @quote.no_of_basements, no_of_businesses: @quote.no_of_businesses, no_of_elevator_cages: @quote.no_of_elevator_cages, no_of_floors: @quote.no_of_floors, no_of_hours_of_activities: @quote.no_of_hours_of_activities, no_of_parking_spaces: @quote.no_of_parking_spaces, product_line: @quote.product_line } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { building_type: @quote.building_type, max_of_occupants_per_floor: @quote.max_of_occupants_per_floor, no_of_apartments: @quote.no_of_apartments, no_of_basements: @quote.no_of_basements, no_of_businesses: @quote.no_of_businesses, no_of_elevator_cages: @quote.no_of_elevator_cages, no_of_floors: @quote.no_of_floors, no_of_hours_of_activities: @quote.no_of_hours_of_activities, no_of_parking_spaces: @quote.no_of_parking_spaces, product_line: @quote.product_line } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
