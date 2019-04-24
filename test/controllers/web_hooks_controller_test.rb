require 'test_helper'

class WebHooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @web_hook = web_hooks(:one)
  end

  test "should get index" do
    get web_hooks_url, as: :json
    assert_response :success
  end

  test "should create web_hook" do
    assert_difference('WebHook.count') do
      post web_hooks_url, params: { web_hook: { auth_params: @web_hook.auth_params, auth_type: @web_hook.auth_type, default_params: @web_hook.default_params, event_type: @web_hook.event_type, method: @web_hook.method, model_type: @web_hook.model_type, url: @web_hook.url } }, as: :json
    end

    assert_response 201
  end

  test "should show web_hook" do
    get web_hook_url(@web_hook), as: :json
    assert_response :success
  end

  test "should update web_hook" do
    patch web_hook_url(@web_hook), params: { web_hook: { auth_params: @web_hook.auth_params, auth_type: @web_hook.auth_type, default_params: @web_hook.default_params, event_type: @web_hook.event_type, method: @web_hook.method, model_type: @web_hook.model_type, url: @web_hook.url } }, as: :json
    assert_response 200
  end

  test "should destroy web_hook" do
    assert_difference('WebHook.count', -1) do
      delete web_hook_url(@web_hook), as: :json
    end

    assert_response 204
  end
end
