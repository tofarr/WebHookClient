require 'test_helper'

class DoohickeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doohickey = doohickeys(:one)
  end

  test "should get index" do
    get doohickeys_url, as: :json
    assert_response :success
  end

  test "should create doohickey" do
    assert_difference('Doohickey.count') do
      post doohickeys_url, params: { doohickey: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show doohickey" do
    get doohickey_url(@doohickey), as: :json
    assert_response :success
  end

  test "should update doohickey" do
    patch doohickey_url(@doohickey), params: { doohickey: {  } }, as: :json
    assert_response 200
  end

  test "should destroy doohickey" do
    assert_difference('Doohickey.count', -1) do
      delete doohickey_url(@doohickey), as: :json
    end

    assert_response 204
  end
end
