@PlanetExpress.module "CrewApp.New", (New, App, Backbone, Marionette, $, _) ->

  New.Controller =
    newCrew: ->
      newView = @getNewView()
      
      newView

    getNewView: ->
      new New.Crew()
