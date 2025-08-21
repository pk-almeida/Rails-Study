class TodoController < ApplicationController
    def index
        @todos = Todo.all
    end

    def new
        @todo = Todo.new
    end

    def create
        todo = Todo.create(todo_params)
        todo.save
        redirect_to todos_path
    end

    def show
        @todo = Todo.find(params[:id])
    end


    private

    def todo_params
        params.require(:todo).permit(:description, :completed)
    end

end
