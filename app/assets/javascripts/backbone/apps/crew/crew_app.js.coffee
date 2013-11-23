@PlanetExpress.module "CrewApp", (CrewApp, App, Backbone, Marionette, $, _) ->

  class CrewApp.Router extends Marionette.AppRouter
    appRoutes:
      "crew": "list"

  API =
    list: ->
      CrewApp.List.Controller.list()

  App.addInitializer ->
    new CrewApp.Router
      controller: API

