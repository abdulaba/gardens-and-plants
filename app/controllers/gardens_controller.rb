class GardensController < ApplicationController
  before_action :set_garden, only: %i(show edit update destroy)
  
  def index
    @gardens = Garden.all
  end

  def show
    @plant = Plant.new
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to gardens_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
  end

  def destroy
  end

  private
  
  def garden_params
    params.require(:garden).permit(:name, :image_url)
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
