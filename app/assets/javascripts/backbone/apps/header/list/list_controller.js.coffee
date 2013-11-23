@PlanetExpress.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =
    list: ->
      listView = @getListView()
      App.headerRegion.show listView

    getListView: ->
      new List.Header()
