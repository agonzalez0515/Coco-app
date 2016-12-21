// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require materialize
//= require materialize-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .



var map;
var markers = [];

var initMap = function() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 33.999656, lng: -118.087183},
    zoom: 5
  });

  $('#date').on('submit', fetchParams)
  var infoWindow = new google.maps.InfoWindow({map: map});

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('You are here.');
      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
};


function fetchParams(e) {
  e.preventDefault();
  var date = $('#date').serialize()
  $.getJSON('/sats?'+date, null, fetchSats);
}

function fetchSats(response) {
  deleteMarkers();
  for (var i = 0; i < response.length; i++) {
    var sat = response[i];
    placeMarkers(sat.latitude, sat.longitude)
    //Append input into form with sat id
    $('.sat-locations').append('<li><input type="radio" name="sat_id" value=" class="new-event-sat-location"'+sat.id+'">'+sat.address+'</li>')

  }
}
$()
$('form').on('click','.sat-locations', function(event){
  event.preventDefault();
  var checked = $(":checked").val();
  console.log(checked);
})

function eventParams(e){
  e.preventDefault();
  var sat = $('#date').serialize()

}
function placeMarkers(lat, lng) {

    var latlng = new google.maps.LatLng(lat, lng);
    new_marker = new google.maps.Marker({
      position: latlng,
      map: map
    });
    markers.push(new_marker);
}

// Sets the map on all markers in the array.
var setMapOnAll = function(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array.
var clearMarkers = function() {
  setMapOnAll(null);
}

// Deletes all markers in the array by removing references to them.
var deleteMarkers = function() {
  clearMarkers();
  markers = [];
}
