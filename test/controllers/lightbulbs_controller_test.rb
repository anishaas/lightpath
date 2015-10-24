require 'test_helper'

class LightbulbsControllerTest < ActionController::TestCase
  setup do
    @lightbulb = lightbulbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lightbulbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lightbulb" do
    assert_difference('Lightbulb.count') do
      post :create, lightbulb: { article_url: @lightbulb.article_url, other: @lightbulb.other, summary: @lightbulb.summary, video_url: @lightbulb.video_url }
    end

    assert_redirected_to lightbulb_path(assigns(:lightbulb))
  end

  test "should show lightbulb" do
    get :show, id: @lightbulb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lightbulb
    assert_response :success
  end

  test "should update lightbulb" do
    patch :update, id: @lightbulb, lightbulb: { article_url: @lightbulb.article_url, other: @lightbulb.other, summary: @lightbulb.summary, video_url: @lightbulb.video_url }
    assert_redirected_to lightbulb_path(assigns(:lightbulb))
  end

  test "should destroy lightbulb" do
    assert_difference('Lightbulb.count', -1) do
      delete :destroy, id: @lightbulb
    end

    assert_redirected_to lightbulbs_path
  end
end
