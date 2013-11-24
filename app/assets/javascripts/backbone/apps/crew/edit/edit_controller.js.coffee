@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  Edit.Controller =
    edit: (id, crew) ->
      crew or= App.request "crew:entity", id

      editView = @getEditView crew

      App.mainRegion.show editView

    getEditView: (crew) ->
      new Edit.Crew
        model: crew

