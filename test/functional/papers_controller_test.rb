require 'test_helper'

class PapersControllerTest < ActionController::TestCase
  setup do
    @paper = papers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:papers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paper" do
    assert_difference('Paper.count') do
      post :create, paper: { file_city: @paper.file_city, file_memo: @paper.file_memo, file_name: @paper.file_name, file_path: @paper.file_path, file_status: @paper.file_status, file_type: @paper.file_type, file_user: @paper.file_user }
    end

    assert_redirected_to paper_path(assigns(:paper))
  end

  test "should show paper" do
    get :show, id: @paper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paper
    assert_response :success
  end

  test "should update paper" do
    put :update, id: @paper, paper: { file_city: @paper.file_city, file_memo: @paper.file_memo, file_name: @paper.file_name, file_path: @paper.file_path, file_status: @paper.file_status, file_type: @paper.file_type, file_user: @paper.file_user }
    assert_redirected_to paper_path(assigns(:paper))
  end

  test "should destroy paper" do
    assert_difference('Paper.count', -1) do
      delete :destroy, id: @paper
    end

    assert_redirected_to papers_path
  end
end
