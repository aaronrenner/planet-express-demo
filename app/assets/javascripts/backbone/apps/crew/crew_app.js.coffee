@PlanetExpress.module "CrewApp", (CrewApp, App, Backbone, Marionette, $, _) ->

  class CrewApp.Router extends Marionette.AppRouter
    appRoutes:
      "crew/:id/edit" : "edit"
      "crew"          : "list"

  API =
    list: ->
      CrewApp.List.Controller.list()

    newCrew: ->
      CrewApp.New.Controller.newCrew()

    edit: (id, member) ->
      CrewApp.Edit.Controller.edit id, member

  App.reqres.setHandler "new:crew:member:view", ->
    API.newCrew()

  App.vent.on "crew:member:clicked", (member) ->
    App.navigate Routes.edit_crew_path(member.id)
    API.edit member.id, member

  App.vent.on "crew:cancelled crew:updated", (crew) ->
    App.navigate Routes.crew_index_path()
    API.list()

  App.addInitializer ->
    new CrewApp.Router
      controller: API

