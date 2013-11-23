@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _ ) ->

  class Entities.Crew extends App.Entities.Model

  class Entities.CrewCollection extends App.Entities.Collection
    model: Entities.Crew

    url: ->
      Routes.crew_index_path()

  API =
    getCrew: ->
      crew = new Entities.CrewCollection
      crew.fetch
        reset: true
      crew

  App.reqres.setHandler "crew:entities", ->
    API.getCrew()
