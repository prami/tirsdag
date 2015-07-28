class TodosController < ApplicationController
  def index
    @todos = Todo.order('created_at asc')
  end
end
