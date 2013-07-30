require 'test_helper'

class SubcontrolsControllerTest < ActionController::TestCase
  setup do
    @subcontrol = subcontrols(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcontrols)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subcontrol" do
    assert_difference('Subcontrol.count') do
      post :create, :subcontrol => @subcontrol.attributes
    end

    assert_redirected_to subcontrol_path(assigns(:subcontrol))
  end

  test "should show subcontrol" do
    get :show, :id => @subcontrol
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @subcontrol
    assert_response :success
  end

  test "should update subcontrol" do
    put :update, :id => @subcontrol, :subcontrol => @subcontrol.attributes
    assert_redirected_to subcontrol_path(assigns(:subcontrol))
  end

  test "should destroy subcontrol" do
    assert_difference('Subcontrol.count', -1) do
      delete :destroy, :id => @subcontrol
    end

    assert_redirected_to subcontrols_path
  end
end
