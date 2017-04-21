class Api::TodosController < Api:ApiController

  def show
  render json: Todo.find(params[:id])
end

def create
  @todo = Todo.new(todo_params)
  if @todo.save
    render json: @todo
  else
    render json: @todo.errors.full_messages, status: 422
  end
end

end
