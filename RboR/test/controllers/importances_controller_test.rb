require "test_helper"

class ImportancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @importance = importances(:one)
  end

  test "should get index" do
    get importances_url
    assert_response :success
  end

  test "should get new" do
    get new_importance_url
    assert_response :success
  end

  test "should create importance" do
    assert_difference("Importance.count") do
      post importances_url, params: { importance: { codeCouleur: @importance.codecouleur, descriptif: @importance.descriptif, @importance.tache_id } }
    end

    assert_redirected_to importance_url(Importance.last)
  end

  test "should show importance" do
    get importance_url(@importance)
    assert_response :success
  end

  test "should get edit" do
    get edit_importance_url(@importance)
    assert_response :success
  end

  test "should update importance" do
    patch importance_url(@importance), params: { importance: { codeCouleur: @importance.codecouleur, descriptif: @importance.descriptif, @importance.tache_id } }
    assert_redirected_to importance_url(@importance)
  end

  test "should destroy importance" do
    assert_difference("Importance.count", -1) do
      delete importance_url(@importance)
    end

    assert_redirected_to importances_url
  end
end
