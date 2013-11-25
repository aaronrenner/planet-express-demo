@PlanetExpress.module "CrewApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =
    
    list:  ->
      crew = App.request "crew:entities"

      App.execute "when:fetched", crew, =>
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

      newView.on "form:cancel", =>
        region.close()

      region.show newView

    crewRegion: (crew)->
      crewView = @getCrewView crew

      crewView.on "childview:crew:member:clicked", (child, args) ->
        App.vent.trigger "crew:member:clicked", args.model

      crewView.on "childview:crew:delete:clicked", (child, args) ->
        model = args.model
        if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false

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
