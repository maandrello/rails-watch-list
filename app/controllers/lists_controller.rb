class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :show, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
    @lists = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
