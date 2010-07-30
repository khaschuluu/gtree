require 'test_helper'

class TabsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tabs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tab" do
    assert_difference('Tab.count') do
      post :create, :tab => { }
    end

    assert_redirected_to tab_path(assigns(:tab))
  end

  test "should show tab" do
    get :show, :id => tabs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tabs(:one).id
    assert_response :success
  end

  test "should update tab" do
    put :update, :id => tabs(:one).id, :tab => { }
    assert_redirected_to tab_path(assigns(:tab))
  end

  test "should destroy tab" do
    assert_difference('Tab.count', -1) do
      delete :destroy, :id => tabs(:one).id
    end

    assert_redirected_to tabs_path
  end
end
