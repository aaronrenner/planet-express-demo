@PlanetExpress.module "Components.Form", (Form, App, Backbone, Marionette, $, _ ) ->

  class Form.FormWrapper extends App.Views.Layout
    template: "form/form"

    tagName: "form"
    attributes: ->
      "data-type": @getFormDataType()

    regions:
      formContentRegion: "#form-content-region"

    ui:
      buttonContainer: "ul.inline-list"

    triggers:
      "submit": "form:submit"

    initialize: ->
      @setInstancePropertiesFor "config", "buttons"

    serializeData: ->
      footer: @config.footer
      buttons: @buttons?.toJSON() ? false
      
    onShow: ->
      _.defer =>
        @focusFirstInput() if @config.focusFirstInput
        @buttonPlacement() if @buttons

    focusFirstInput: ->
      @$(':input:visible:enabled:first').focus()

    buttonPlacement: ->
      @ui.buttonContainer.addClass @buttons.placement

    getFormDataType: ->
      if @model.isNew() then "new" else "edit"
