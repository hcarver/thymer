require 'test_helper'

class OutsourcedTasksControllerTest < ActionController::TestCase
  setup do
    @outsourced_task = outsourced_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outsourced_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outsourced_task" do
    assert_difference('OutsourcedTask.count') do
      post :create, outsourced_task: { actual_cost_cents: @outsourced_task.actual_cost_cents, charged_to_client_cents: @outsourced_task.charged_to_client_cents, estimated_cost_cents: @outsourced_task.estimated_cost_cents, name: @outsourced_task.name, project_id: @outsourced_task.project_id, slug: @outsourced_task.slug }
    end

    assert_redirected_to outsourced_task_path(assigns(:outsourced_task))
  end

  test "should show outsourced_task" do
    get :show, id: @outsourced_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outsourced_task
    assert_response :success
  end

  test "should update outsourced_task" do
    patch :update, id: @outsourced_task, outsourced_task: { actual_cost_cents: @outsourced_task.actual_cost_cents, charged_to_client_cents: @outsourced_task.charged_to_client_cents, estimated_cost_cents: @outsourced_task.estimated_cost_cents, name: @outsourced_task.name, project_id: @outsourced_task.project_id, slug: @outsourced_task.slug }
    assert_redirected_to outsourced_task_path(assigns(:outsourced_task))
  end

  test "should destroy outsourced_task" do
    assert_difference('OutsourcedTask.count', -1) do
      delete :destroy, id: @outsourced_task
    end

    assert_redirected_to outsourced_tasks_path
  end
end
