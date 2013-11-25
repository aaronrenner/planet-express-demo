@PlanetExpress.module "CrewApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  Edit.Controller =
    edit: (id, crew) ->
      crew or= App.request "crew:entity", id

      crew.on "all", (e) -> console.log(e)

      App.execute "when:fetched", crew, =>
        @layout = @getLayoutView crew

        @layout.on "show", =>
          @titleRegion crew
          @formRegion crew

        App.mainRegion.show @layout

    titleRegion: (crew) ->
      titleView = @getTitleView crew

      @layout.titleRegion.show titleView

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

    getTitleView: (crew) ->
      new Edit.Title
        model: crew


