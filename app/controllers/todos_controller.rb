class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos or /todos.json
  def index
    @todos = Todo.all
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params)
    respond_to do |format|
      if @todo.save
        respond_to do |format|
          format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
        end
      else
        render :index
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    respond_to do |format|
      format.html { redirect_to todos_path }
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_path, notice: 'Todo was successfully deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find_by(id: params[:id])
      redirect_to todos_path, alert: 'Todo not found.' unless @todo
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:content, :completed)
    end
end
