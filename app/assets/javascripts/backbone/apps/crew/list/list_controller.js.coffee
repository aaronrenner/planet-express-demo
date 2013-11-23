@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =
    
    list:  ->
      crew = App.request "crew:entities"

      @layout = @getLayoutView()

      @layout.on "show", =>
        @titleRegion()
        @panelRegion()
        @newRegion()
        @crewRegion crew


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

    crewRegion: (crew)->
      crewView = @getCrewView crew
      @layout.crewRegion.show crewView


    getLayoutView: ->
      new List.Layout

    getTitleView: ->
      new List.Title

    getPanelView: ->
      new List.Panel

    getNewView: ->
      new List.New
    
    getCrewView: (crew)->
      new List.Crew
        collection: crew
