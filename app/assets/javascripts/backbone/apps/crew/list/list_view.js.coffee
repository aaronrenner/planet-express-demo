@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "crew/list/list_layout"

    regions:
      titleRegion: "#title-region"

  class List.Title extends App.Views.ItemView
    template: "crew/list/_title"
