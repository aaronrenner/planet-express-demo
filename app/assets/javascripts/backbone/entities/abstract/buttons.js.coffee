@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _ ) ->

  class Entities.Button extends Entities.Model

  class Entities.ButtonsCollection extends Entities.Collection
    model: Entities.Button

  API=
    getFormButtons: (buttons, model) ->
      buttons = @getDefaultButtons buttons, model

      array = []

      array.push {type: "cancel", className: "button small secondary radius",  text: buttons.cancel} unless buttons.cancel is false
      array.push {type: "priamry", className: "button small radius",  text: buttons.primary} unless buttons.primary is false

      array.reverse() if buttons.placement is "left"

      buttonsCollection = new Entities.ButtonsCollection array
      buttonsCollection.placement = buttons.placement
      buttonsCollection

    getDefaultButtons: (buttons, model) ->
      _.defaults buttons,
        primary: if model.isNew() then "Create" else "Update"
        cancel: "Cancel"
        placement: "right"

  App.reqres.setHandler "form:button:entities", (buttons = {}, model) ->
    API.getFormButtons buttons, model
