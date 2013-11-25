@PlanetExpress.module "Controllers", (Controllers, App, Backbone, Marionette, $, _) ->

  class Controllers.Base extends Marionette.Controller

    constructor: (options={}) ->
      @region = options.region or App.request "default:region"
      super options

      # Registers our controller with the application so we can see the currently defined controller objects
      # Helps us detect memory leaks
      @_instance_id = _.uniqueId("controller")
      App.execute "register:instance", @, @_instance_id

    close: (args...) ->
      super args
      App.execute "unregister:instance", @, @_instance_id

    # Renders the view in the selected region and binds to view's close event
    show: (view) ->
      @listenTo view, "close", @close
      @region.show view
