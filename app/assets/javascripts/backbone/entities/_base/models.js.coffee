@PlanetExpress.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Model extends Backbone.Model

    save: (data, options = {}) ->
      isNew = @isNew()

      _.defaults options,
        wait: true
        success: _.bind(@saveSuccess, @, isNew, options.collection)
        error: _.bind(@saveError, @)

      @unset "_errors"
      super data, options

    saveSuccess: (isNew, collection) =>
      console.info "success", @, isNew
      if isNew ## model is being created
        collection.add @ if collection
        collection.trigger "model:created", @ if collection
        @trigger "created", @
      else ## model is being updated
        collection ?= @collection ## if model has colelction property defined, use that if no collection
        collection.trigger "model:updated", @ if collection
        @trigger "updated", @

    saveError: (model, xhr, options) ->
      ## set errors directly on the model unless status returned was 500 or 404
      @set _errors: $.parseJSON(xhr.responseText)?.errors unless xhr.status is 500 or xhr.status is 404

