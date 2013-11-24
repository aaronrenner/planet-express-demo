class CrewController < ApplicationController
  respond_to :json

  def index
    respond_with Crew.all
  end

  def show
    sleep 3
    respond_with Crew.find(params[:id])
  end
end
