require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_session" do
    assert_difference('UserSession.count') do
      post :create, :user_session => { }
    end

    assert_redirected_to user_session_path(assigns(:user_session))
  end

  test "should show user_session" do
    get :show, :id => user_sessions(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => user_sessions(:one).id
    assert_response :success
  end

  test "should update user_session" do
    put :update, :id => user_sessions(:one).id, :user_session => { }
    assert_redirected_to user_session_path(assigns(:user_session))
  end

  test "should destroy user_session" do
    assert_difference('UserSession.count', -1) do
      delete :destroy, :id => user_sessions(:one).id
    end

    assert_redirected_to user_sessions_path
  end
end
