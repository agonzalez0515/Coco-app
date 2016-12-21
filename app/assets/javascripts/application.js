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
//= require jquery_ujs
//= require turbolinks
//= require moment
//= require fullcalendar
//= require_tree .


var map;

var initMap = function() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 33.999656, lng: -118.087183},
    zoom: 5
  });

  $('#date').on('submit', fetchResults)
};

function fetchResults(e) {
  e.preventDefault();
  getSatsNearMapCenter()
}

function getSatsNearMapCenter() {
  var geocoder = new google.maps.Geocoder;
  var lat = map.getCenter().lat()
  var lng = map.getCenter().lng()

  var latlng = {lat: lat, lng: lng};
  geocoder.geocode({'location': latlng}, getNearbySats);
}

function getNearbySats(results, status) {
  if (status === 'OK') {
    var date = $('#date').serialize()
    var params = date + "&address=" + encodeURI(results[1].formatted_address)

    $.getJSON('/sats?'+params, null, fetchSats);
  }
}

function fetchSats(response) {
  for (var i = 0; i < response.length; i++) {
    var sat = response[i];
    placeMarkers(sat.latitude, sat.longitude)
  }
}

function placeMarkers(lat, lng) {
    var latlng = new google.maps.LatLng(lat, lng);
    new google.maps.Marker({
      position: latlng,
      map: map
    });
}
