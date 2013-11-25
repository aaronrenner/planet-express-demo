class CrewController < ApplicationController
  respond_to :json

  def index
    respond_with Crew.all
  end

  def show
    respond_with Crew.find(params[:id])
  end

  def update
    respond_with(Crew.update params[:id], crew_params)
  end

  def create
    respond_with(Crew.create crew_params)
  end

  private

  def crew_params
    params.permit(:age, :name, :avatar, :title, :species, :origin, :quote)
  end
end
