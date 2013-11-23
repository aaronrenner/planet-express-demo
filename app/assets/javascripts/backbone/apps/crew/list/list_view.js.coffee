@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "crew/list/list_layout"

    regions:
      titleRegion: "#title-region"
      panelRegion: "#panel-region"
      newRegion: "#new-region"
      crewRegion: "#crew-region"

  class List.Title extends App.Views.ItemView
    template: "crew/list/_title"

  class List.Panel extends App.Views.ItemView
    template: "crew/list/_panel"

  class List.New extends App.Views.ItemView
    template: "crew/list/_new"

  class List.Crew extends App.Views.ItemView
    template: "crew/list/_crew"
