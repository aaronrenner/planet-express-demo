@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  Edit.Controller =
    edit: (id, crew) ->
      crew or= App.request "crew:entity", id

      App.execute "when:fetched", crew, =>
        editView = @getEditView crew

        App.mainRegion.show editView

    getEditView: (crew) ->
      new Edit.Crew
        model: crew


  # Video 1 at 56:19
  App.commands.setHandler "when:fetched", (entities, callback) ->
    xhrs = []

    xhrs= _.chain([entities]).flatten().pluck("_fetch").value()

    # if _.isArray(entities)
    #   xhrs.push(entity._fetch) for entity in entities
    # else
    #   xhrs.push(entities._fetch)

    $.when(xhrs...).done ->
      callback()
