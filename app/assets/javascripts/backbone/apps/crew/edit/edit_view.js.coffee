@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Crew extends App.Views.ItemView
    template: "crew/edit/edit_crew"


    modelEvents:
      "sync" : "render"
