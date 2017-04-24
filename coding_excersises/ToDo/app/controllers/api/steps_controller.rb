class Api::StepsController < Api::ApiController

  def index
    steps = Step.find(params[:id]).steps
    render json: steps
  end

  def create
    step = Step.new(step_params)

    if step.save
      render json: step
    else
      render json: step.errors.full_messages, status: 422
    end
  end

  def update
  end

  def show
  end

  private

  def step_params
    params.require(:step).permit(:title,:body,:done)
  end
end
