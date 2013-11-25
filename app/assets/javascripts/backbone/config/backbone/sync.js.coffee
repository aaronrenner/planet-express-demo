do (Backbone) ->
  _sync = Backbone.sync
  Backbone.sync = (method, entity, options= {}) ->

    #Setting up options for jquery callbacks
    _.defaults options,
      beforeSend: _.bind(methods.beforeSend, entity)
      complete:   _.bind(methods.complete,   entity)

    # Calls the built in sync and stores the xhr object back on 
    # entity._fetch so we can use a jQuery.when in entities/_base/_fetch
    sync = _sync(method, entity, options)
    if !entity._fetch and method is "read"
      entity._fetch = sync

  methods =
    #This refers to model itself
    beforeSend: ->
      @trigger "sync:start", @

    complete: ->
      @trigger "sync:complete", @
