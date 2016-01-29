require 'test_helper'

class StudyAreasControllerTest < ActionController::TestCase
  setup do
    @study_area = study_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_area" do
    assert_difference('StudyArea.count') do
      post :create, study_area: { name: @study_area.name }
    end

    assert_redirected_to study_area_path(assigns(:study_area))
  end

  test "should show study_area" do
    get :show, id: @study_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_area
    assert_response :success
  end

  test "should update study_area" do
    patch :update, id: @study_area, study_area: { name: @study_area.name }
    assert_redirected_to study_area_path(assigns(:study_area))
  end

  test "should destroy study_area" do
    assert_difference('StudyArea.count', -1) do
      delete :destroy, id: @study_area
    end

    assert_redirected_to study_areas_path
  end
end
