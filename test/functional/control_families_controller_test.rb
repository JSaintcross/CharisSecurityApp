require 'test_helper'

class ControlFamiliesControllerTest < ActionController::TestCase
  setup do
    @control_family = control_families(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:control_families)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create control_family" do
    assert_difference('ControlFamily.count') do
      post :create, :control_family => @control_family.attributes
    end

    assert_redirected_to control_family_path(assigns(:control_family))
  end

  test "should show control_family" do
    get :show, :id => @control_family
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @control_family
    assert_response :success
  end

  test "should update control_family" do
    put :update, :id => @control_family, :control_family => @control_family.attributes
    assert_redirected_to control_family_path(assigns(:control_family))
  end

  test "should destroy control_family" do
    assert_difference('ControlFamily.count', -1) do
      delete :destroy, :id => @control_family
    end

    assert_redirected_to control_families_path
  end
end
