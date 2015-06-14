# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# get JSON object
# on success, parse it and
# hand it over to MapBox for mapping

$(document).ready ->

  L.mapbox.accessToken = 'pk.eyJ1IjoibmFjaG9wZSIsImEiOiI1NWU1NTU4ZWMwZDY0N2EzMzNjOWRmMzI0OWNkZWFmNiJ9.vJEDvTiigh5rONaLVEeOdQ'
  map = L.mapbox.map('map', 'nachope.a61a77e9').setView([
    37.741
    -0.857
  ], 3)

  map.scrollWheelZoom.disable();

  $.ajax
    dataType: 'text'
    url: 'projects.json'
    success: (data) ->
      geojson = $.parseJSON(data)
      map.featureLayer.setGeoJSON(geojson)

  # add custom popups to each marker
  map.featureLayer.on 'layeradd', (e) ->
    marker = e.layer
    properties = marker.feature.properties

    # create custom popup
    popupContent =  '<div class="popup">' +
                      '<h3>' + properties.name + '</h3>' +
                      '<p>' + properties.description + '</p>' +
                    '</div>'

    # http://leafletjs.com/reference.html#popup
    marker.bindPopup popupContent,
      closeButton: true
      minWidth: 320
