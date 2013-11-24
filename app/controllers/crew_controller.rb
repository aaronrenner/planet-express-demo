class CrewController < ApplicationController
  respond_to :json

  def index
    respond_with Crew.all
  end

  def show
    respond_with Crew.find(params[:id])
  end
end
