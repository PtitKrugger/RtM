require "application_system_test_case"

class ImportancesTest < ApplicationSystemTestCase
  setup do
    @importance = importances(:one)
  end

  test "visiting the index" do
    visit importances_url
    assert_selector "h1", text: "Importances"
  end

  test "should create importance" do
    visit importances_url
    click_on "New importance"

    fill_in "Codecouleur", with: @importance.codecouleur
    fill_in "Descriptif", with: @importance.descriptif
    click_on "Create Importance"

    assert_text "Importance was successfully created"
    click_on "Back"
  end

  test "should update Importance" do
    visit importance_url(@importance)
    click_on "Edit this importance", match: :first

    fill_in "Codecouleur", with: @importance.codecouleur
    fill_in "Descriptif", with: @importance.descriptif
    click_on "Update Importance"

    assert_text "Importance was successfully updated"
    click_on "Back"
  end

  test "should destroy Importance" do
    visit importance_url(@importance)
    click_on "Destroy this importance", match: :first

    assert_text "Importance was successfully destroyed"
  end
end
