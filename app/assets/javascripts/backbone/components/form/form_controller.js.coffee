@PlanetExpress.module "Components.Form", (Form, App, Backbone, Marionette, $, _ ) ->

  class Form.Controller extends Marionette.Controller

    initialize: (options = {}) ->
      @contentView = options.view

      @formLayout = @getFormLayout options.config

      @formLayout.on "show", =>
        @formContentRegion()

    formContentRegion: ->
      @formLayout.formContentRegion.show @contentView

    getFormLayout: (config = {}) ->
      new Form.FormWrapper


  App.reqres.setHandler "form:wrapper", (contentView, options={})->
    formController = new Form.Controller
      view: contentView
      config: options
    
    formController.formLayout
