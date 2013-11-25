@PlanetExpress.module "Components.Form", (Form, App, Backbone, Marionette, $, _ ) ->

  class Form.FormWrapper extends App.Views.Layout
    template: "form/form"

    tagName: "form"
    attributes:
      "data-type": "edit"

    regions:
      formContentRegion: "#form-content-region"
