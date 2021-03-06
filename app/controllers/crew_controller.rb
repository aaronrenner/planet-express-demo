class CrewController < ApplicationController
  respond_to :json

  def index
    respond_with Crew.all
  end

  def show
    respond_with Crew.find(params[:id])
  end

  def update
    sleep 2
    respond_with(Crew.update params[:id], crew_params)
  end

  def create
    sleep 2
    respond_with(Crew.create crew_params)
  end

  def destroy
    sleep 2
    respond_with(Crew.destroy params[:id])
  end

  private

  def crew_params
    params.permit(:age, :name, :avatar, :title, :species, :origin, :quote)
  end
end
