class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  def index
    @steps = Step.all
  end

  def new
    @step = Step.new
    @list = List.find(params[:list_id])
  end

  def create
    @step = Step.new(description: params[:step][:description],list_id: params[:list_id])
    if @step.save
      flash[:notice] = "Step has been created."
      redirect_to list_path(params[:list_id])
    else
      flash.now[:error] =  "Step could not be saved."
      render :new
    end
  end

  def show
    @step = Step.where(list_id: params[:list_id])[params[:id].to_i - 1]
  end

  def destroy
    @step.delete
    redirect_to lists_path, notice: 'Step was successfully destroyed.'
  end

private
  def set_step
    @step = Step.find(params[:id])
  end
end
