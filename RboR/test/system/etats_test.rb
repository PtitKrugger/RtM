require "application_system_test_case"

class EtatsTest < ApplicationSystemTestCase
  setup do
    @etat = etats(:one)
  end

  test "visiting the index" do
    visit etats_url
    assert_selector "h1", text: "Etats"
  end

  test "should create etat" do
    visit etats_url
    click_on "New etat"

    fill_in "Etat", with: @etat.etat
    click_on "Create Etat"

    assert_text "Etat was successfully created"
    click_on "Back"
  end

  test "should update Etat" do
    visit etat_url(@etat)
    click_on "Edit this etat", match: :first

    fill_in "Etat", with: @etat.etat
    click_on "Update Etat"

    assert_text "Etat was successfully updated"
    click_on "Back"
  end

  test "should destroy Etat" do
    visit etat_url(@etat)
    click_on "Destroy this etat", match: :first

    assert_text "Etat was successfully destroyed"
  end
end
