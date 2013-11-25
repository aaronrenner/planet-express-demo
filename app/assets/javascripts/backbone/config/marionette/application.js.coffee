do (Backbone) ->

  _.extend Backbone.Marionette.Application::,

    navigate: (route, options = {}) ->
      route = "#" + route if route.charAt(0) is "/"
      Backbone.history.navigate route, options

    getCurrentRoute: ->
      frag = Backbone.history.fragment
      if _.isEmpty(frag) then null else frag

    startHistory: ->
      if Backbone.history
        Backbone.history.start()

    #Allows program to register controllers to detect memory leaks
    register: (instance, id) ->
      @_registry ?= {}
      @_registry[id] = instance

    unregister: (instance, id) ->
      delete @_registry[id]

    resetRegistry: ->
      oldCount = @getRegistrySize()
      for key, controller of @_registry

        # Close each region that a controller is attached to. Since
        # a region can only be closed once, if there are multiple
        # controllers attached to the same region, those controllers
        # won't be closed and therefor won't be unregistered
        controller.region.close()

      msg = "There were #{oldCount} controllers in the registry. There are now #{@getRegistrySize()}"
      if @getRegistrySize > 0 then console.warn(msg, @_registry) else console.log (msg)
        

    getRegistrySize: ->
      _.size @_registry
