class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List has been created."
      redirect_to @list
    else
      flash.now[:error] =  "List could not be saved."
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def edit

  end

  def update
    if @list.update_attributes(list_params)
      redirect_to @list, notice: "List was Successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    flash[:notice] = 'List was successfully destroyed.'
  end

private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
