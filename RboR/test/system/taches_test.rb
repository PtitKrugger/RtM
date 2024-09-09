require "application_system_test_case"

class TachesTest < ApplicationSystemTestCase
  setup do
    @tache = taches(:one)
  end

  test "visiting the index" do
    visit taches_url
    assert_selector "h1", text: "Taches"
  end

  test "should create tache" do
    visit taches_url
    click_on "New tache"

    fill_in "Texte", with: @tache.texte
    click_on "Create Tache"

    assert_text "Tache was successfully created"
    click_on "Back"
  end

  test "should update Tache" do
    visit tache_url(@tache)
    click_on "Edit this tache", match: :first

    fill_in "Texte", with: @tache.texte
    click_on "Update Tache"

    assert_text "Tache was successfully updated"
    click_on "Back"
  end

  test "should destroy Tache" do
    visit tache_url(@tache)
    click_on "Destroy this tache", match: :first

    assert_text "Tache was successfully destroyed"
  end
end
