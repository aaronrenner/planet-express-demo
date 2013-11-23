@PlanetExpress.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: ->
      showView = @getShowView()
      App.footerRegion.show showView

    getShowView: ->
      new Show.Footer

