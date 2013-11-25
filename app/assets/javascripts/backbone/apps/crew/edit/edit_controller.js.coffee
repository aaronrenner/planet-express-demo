@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  Edit.Controller =
    edit: (id, crew) ->
      crew or= App.request "crew:entity", id

      App.execute "when:fetched", crew, =>
        @layout = @getLayoutView crew

        @layout.on "show", =>
          @formRegion crew

        App.mainRegion.show @layout

    formRegion: (crew) ->
      editView = @getEditView crew

      formView = App.request "form:wrapper", editView,
        footer: true


      @layout.formRegion.show formView


    getLayoutView: (crew) ->
      new Edit.Layout
        model: crew

    getEditView: (crew) ->
      new Edit.Crew
        model: crew


