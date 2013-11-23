class CrewController < ApplicationController
  respond_to :json

  def index
    respond_with Crew.all
  end
end
