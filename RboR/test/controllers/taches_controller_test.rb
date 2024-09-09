require "test_helper"

class TachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tache = taches(:one)
  end

  test "should get index" do
    get taches_url
    assert_response :success
  end

  test "should get new" do
    get new_tache_url
    assert_response :success
  end

  test "should create tache" do
    assert_difference("Tache.count") do
      post taches_url, params: { tache: { descriptif: @tache.descriptif } }
    end

    assert_redirected_to tache_url(Tache.last)
  end

  test "should show tache" do
    get tache_url(@tache)
    assert_response :success
  end

  test "should get edit" do
    get edit_tache_url(@tache)
    assert_response :success
  end

  test "should update tache" do
    patch tache_url(@tache), params: { tach: { descriptif: @tache.descriptif, codecouleur: @tache.codecouleur, importance_id: @tache.importance_id } }
    assert_redirected_to tache_url(@tache)
  end

  test "should destroy tache" do
    assert_difference("Tache.count", -1) do
      delete tache_url(@tache)
    end

    assert_redirected_to taches_url
  end
end
