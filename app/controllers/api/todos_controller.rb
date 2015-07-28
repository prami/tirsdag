class Api::TodosController < ApplicationController
  def index
    @todos = Todo.order('created_at asc')
    render json: @todos
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      render json: @todo
    else
      render :json, nothing: true, status: 422
    end
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render :json, nothing: true, status: 422
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      render json: @todo
    else
      render :json, nothing: true, status: 422
    end
  end

  def destroy_completed
    if Todo.where(completed: true).destroy_all
      render :json, nothing: true
    else
      render :json, nothing: true, status: 422
    end
  end


  private
  def todo_params
    params.permit(:title, :completed)
  end
end
