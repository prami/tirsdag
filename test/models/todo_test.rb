require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  def setup
    @todo = Todo.new(title: 'Test')
  end

  test "saves to database" do
    assert_saves(@todo)
  end

  test "should have title" do
    @todo.title = nil
    assert_equal false, @todo.valid?
  end

  test "completed should by false by default" do
    assert_equal false, @todo.completed
  end
end
