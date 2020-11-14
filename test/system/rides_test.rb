require "application_system_test_case"

class RidesTest < ApplicationSystemTestCase
  setup do
    @ride = rides(:one)
  end

  test "visiting the index" do
    visit rides_url
    assert_selector "h1", text: "Rides"
  end

  test "creating a Ride" do
    visit rides_url
    click_on "New Ride"

    fill_in "Cost", with: @ride.cost
    fill_in "Details", with: @ride.details
    fill_in "Duration", with: @ride.duration
    fill_in "Email", with: @ride.email
    fill_in "First name", with: @ride.first_name
    fill_in "Last name", with: @ride.last_name
    fill_in "Location", with: @ride.location
    fill_in "User", with: @ride.user_id
    click_on "Create Ride"

    assert_text "Ride was successfully created"
    click_on "Back"
  end

  test "updating a Ride" do
    visit rides_url
    click_on "Edit", match: :first

    fill_in "Cost", with: @ride.cost
    fill_in "Details", with: @ride.details
    fill_in "Duration", with: @ride.duration
    fill_in "Email", with: @ride.email
    fill_in "First name", with: @ride.first_name
    fill_in "Last name", with: @ride.last_name
    fill_in "Location", with: @ride.location
    fill_in "User", with: @ride.user_id
    click_on "Update Ride"

    assert_text "Ride was successfully updated"
    click_on "Back"
  end

  test "destroying a Ride" do
    visit rides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ride was successfully destroyed"
  end
end
