require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "Building type", with: @quote.building_type
    fill_in "Max of occupants per floor", with: @quote.max_of_occupants_per_floor
    fill_in "No of apartments", with: @quote.no_of_apartments
    fill_in "No of basements", with: @quote.no_of_basements
    fill_in "No of businesses", with: @quote.no_of_businesses
    fill_in "No of elevator cages", with: @quote.no_of_elevator_cages
    fill_in "No of floors", with: @quote.no_of_floors
    fill_in "No of hours of activities", with: @quote.no_of_hours_of_activities
    fill_in "No of parking spaces", with: @quote.no_of_parking_spaces
    fill_in "Product line", with: @quote.product_line
    fill_in "Total price of elevators", with: @quote.total_price_of_elevators
    fill_in "Installation_fees", with: @quote.installation_fees
    fill_in "Final price", with: @quote.final_price
    fill_in "Product line", with: @quote.product_line
    click_on "Calculate Now"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "Building type", with: @quote.building_type
    fill_in "Max of occupants per floor", with: @quote.max_of_occupants_per_floor
    fill_in "No of apartments", with: @quote.no_of_apartments
    fill_in "No of basements", with: @quote.no_of_basements
    fill_in "No of businesses", with: @quote.no_of_businesses
    fill_in "No of elevator cages", with: @quote.no_of_elevator_cages
    fill_in "No of floors", with: @quote.no_of_floors
    fill_in "No of hours of activities", with: @quote.no_of_hours_of_activities
    fill_in "No of parking spaces", with: @quote.no_of_parking_spaces
    fill_in "No of elevators needed ", with: @quote.no_of_elevators_needed 
    fill_in "Unit price", with: @quote.unit_price
    fill_in "Total price of elevators", with: @quote.total_price_of_elevators
    fill_in "Installation_fees", with: @quote.installation_fees
    fill_in "Final price", with: @quote.final_price
    fill_in "Product line", with: @quote.product_line
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
