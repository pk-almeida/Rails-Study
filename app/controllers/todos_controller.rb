class TodosController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @todos = current_user.todos.order(created_at: :desc)
    end

    def new
        @todo = current_user.todos.new
    end

    def create
        @todo = current_user.todos.new(todo_params)
        if @todo.save
            redirect_to todos_path
        else 
            # redirect_to todos_new_path, status: :unprocessable_entity
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        @todo.update(todo_params)
        redirect_to todos_path
        # @todo.description = todo_params[:description]
        # @todo.completed = todo_params[:completed]
        # @todo.save
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def destroy
        todo = current_user.todos.find(params[:id])
        todo.destroy
        redirect_to todos_path
    end


    private

    def todo_params
        params.require(:todo).permit(:description, :completed)
    end

end
