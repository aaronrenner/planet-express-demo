@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

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
