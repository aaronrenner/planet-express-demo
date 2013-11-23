@PlanetExpress.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
  @startWithParent

  API =
    show: ->
      FooterApp.Show.Controller.show()

  FooterApp.on "start", ->
    API.show()
