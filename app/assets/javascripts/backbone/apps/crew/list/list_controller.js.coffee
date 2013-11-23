@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =
    
    list:  ->
      @layout = @getLayoutView()

      @layout.on "show", =>
        @titleRegion()
        @panelRegion()
        @newRegion()
        @crewRegion()


      App.mainRegion.show @layout

    titleRegion: ->
      titleView = @getTitleView()
      @layout.titleRegion.show titleView

    panelRegion: ->
      panelView = @getPanelView()
      @layout.panelRegion.show panelView

    newRegion: ->
      newView = @getNewView()
      @layout.newRegion.show newView

    crewRegion: ->
      crewView = @getCrewView()
      @layout.crewRegion.show crewView


    getLayoutView: ->
      new List.Layout

    getTitleView: ->
      new List.Title

    getPanelView: ->
      new List.Panel

    getNewView: ->
      new List.New
    
    getCrewView: ->
      new List.Crew
