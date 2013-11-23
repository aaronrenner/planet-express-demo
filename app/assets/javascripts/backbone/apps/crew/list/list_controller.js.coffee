@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =
    
    list:  ->
      @layout = @getLayoutView()

      @layout.on "show", =>
        @titleRegion()


      App.mainRegion.show @layout

    titleRegion: ->
      titleView = @getTitleView()
      @layout.titleRegion.show titleView

    getLayoutView: ->
      new List.Layout

    getTitleView: ->
      new List.Title
