require 'test_helper'
require 'minitest/autorun'

class OffensesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    sign_in admin_users(:one)
    @offense = offenses(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:offenses)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create offense when resolv returns nil' do 
    Resolv.stub(:getname, nil) do
      assert_difference('Offense.count') do
        post :create, offense: {}
      end
    end

    assert_redirected_to offense_path(assigns(:offense))
    assert_equal 'n/a', assigns(:offense).host_name
  end

  test 'should create offense when resolv returns a valid value' do 
    Resolv.stub(:getname, 'teststring') do
      assert_difference('Offense.count') do
        post :create, offense: {}
      end
    end

    assert_redirected_to offense_path(assigns(:offense))
    assert_equal 'teststring', assigns(:offense).host_name
  end
 
  test 'should create offense when resolv raises an exception' do       
    assert_difference('Offense.count') do
      post :create, offense: {}
    end

     assert_redirected_to offense_path(assigns(:offense))
     assert_equal 'n/a', assigns(:offense).host_name
  end

  test 'should show offense' do
    get :show, id: @offense
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @offense
    assert_response :success
  end

  test 'should update offense' do
    patch :update, id: @offense, offense: {ip_address: '127.0.0.3', host_name: 'teststring'}
    assert_redirected_to offense_path(assigns(:offense))
  end

  test 'should destroy offense' do
    assert_difference('Offense.count', -1) do
      delete :destroy, id: @offense
    end

    assert_redirected_to offenses_path
  end

  # probably will nix this and just expose :create eventually
  test "should not require authentication for 'new'" do
    sign_out admin_users(:one)
    get :new
    assert_response :success
  end

  test 'should not require authentication to create offense' do
    sign_out admin_users(:one)
    assert_difference('Offense.count') do
      post :create, offense: { }
    end

    assert_redirected_to offense_path(assigns(:offense))
  end

  test 'should not show offense without authentication' do
    sign_out admin_users(:one)
    get :show, id: @offense
    assert_response :redirect
  end
end
