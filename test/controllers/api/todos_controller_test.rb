require 'test_helper'

class Api::TodosControllerTest < ActionController::TestCase

  def setup
    Todo.create(title: 'Test 1', completed: true)
    Todo.create(title: 'Test 2', completed: false)
  end

  test "get all todos" do
    get :index
    assert_response :success
    assert_not_nil assigns(:todos)
  end

  test "create todo" do
    post :create, {title: "Test 3"}
    assert_response :success
    assert_equal Todo.where(title: "Test 3").count, 1
  end

  test "update todo" do
    todo = Todo.last
    post :update, {id: todo.id, title: "Modified"}
    assert_response :success
    assert_equal Todo.where(title: "Modified").last.id, todo.id
  end

  test "delete todo" do
    todo = Todo.last
    post :destroy, {id: todo.id}
    assert_response :success
    exception = assert_raise(Exception) { Todo.find(todo.id) }
    assert_equal( "Couldn't find Todo with 'id'=#{todo.id}", exception.message )
  end

  test "delete all completed todos" do
    post :destroy_completed
    assert_response :success
    assert_equal 0, Todo.where(completed: true).count
  end
end
