@PlanetExpress.module "CrewApp", (CrewApp, App, Backbone, Marionette, $, _) ->

  class CrewApp.Router extends Marionette.AppRouter
    appRoutes:
      "crew": "list"

  API =
    list: ->
      CrewApp.List.Controller.list()

    newCrew: ->
      CrewApp.New.Controller.newCrew()

  App.reqres.setHandler "new:crew:member:view", ->
    API.newCrew()

  App.addInitializer ->
    new CrewApp.Router
      controller: API

