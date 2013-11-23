@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =
    
    list:  ->
      crew = App.request "crew:entities"

      @layout = @getLayoutView()

      @layout.on "show", =>
        @titleRegion()
        @panelRegion()
        @crewRegion crew


      App.mainRegion.show @layout

    titleRegion: ->
      titleView = @getTitleView()
      @layout.titleRegion.show titleView

    panelRegion: ->
      panelView = @getPanelView()

      panelView.on "new:crew:button:clicked", =>
        @newRegion()

      @layout.panelRegion.show panelView

    newRegion: ->
      region = @layout.newRegion
      newView = App.request "new:crew:member:view"

      newView.on "form:cancel:button:clicked", =>
        region.close()

      region.show newView

    crewRegion: (crew)->
      crewView = @getCrewView crew
      @layout.crewRegion.show crewView


    getLayoutView: ->
      new List.Layout

    getTitleView: ->
      new List.Title

    getPanelView: ->
      new List.Panel

    getCrewView: (crew)->
      new List.Crew
        collection: crew
