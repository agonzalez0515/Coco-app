
$(document).ready(function() {

});


var map;
var markers = [];

// Initialize a Map for SAT Location selection.
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

// Create a small map for Event Page
var initSmallMap = function() {
  smallMap = new google.maps.Map(document.getElementById('small_map'), {
    center: {lat: 37.784, lng: -122.55},
    zoom: 10
  });

  var latlng = new google.maps.LatLng(37.784, -122.55);
  new_marker = new google.maps.Marker({
    position: latlng,
    map: smallMap
  });
};

// Listen to SAT Location selector form
$('form').on('click','.sat-locations', function(event){
  event.preventDefault();
  var checked = $(":checked").val();
  console.log(checked);
});

// Find 10 closest SAT locations to center of SAT selection map

function fetchParams(e) {
  e.preventDefault();
  var date = $('#date').serialize();
  var ajax_lat = map.getCenter().lat();
  var ajax_long = map.getCenter().lng();
  // $.getJSON('/sats?'+date, null, fetchSats);
  $.getJSON('/sats?'+date+'&user_lat='+ajax_lat+'&user_long='+ajax_long, null, fetchSats);
}

// Plot markers of 10 closest SAT locations and dynamically populate SAT
// location selection form
function fetchSats(response) {
  deleteMarkers();
  for (var i = 0; i < response.length; i++) {
    var sat = response[i];
    placeMarkers(sat.latitude, sat.longitude, sat.location_name)
    //Append input into form with sat id
    $('.sat-locations').append('<li><input type="radio" name="sat_id" value="'+sat.id+'" class="with-gap" id="'+sat.id+'" ><label for="'+sat.id+'">'+sat.address+'</label></li>' )
  }
}
// Plot a marker
function placeMarkers(lat, lng, loc_name) {
  var pinIcon = {
    url: "https://s30.postimg.org/68ej2wfu9/marker3.png",
    size: null, /* size is determined at runtime */
    origin: new google.maps.Point(0,0), /* origin is 0,0 */
    anchor: null, /* anchor is bottom center of the scaled image */
    scaledSize: null 
  };

    var latlng = new google.maps.LatLng(lat, lng);

    new_marker = new google.maps.Marker({
      icon: pinIcon,
      position: latlng,
      title: (loc_name),
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

var getMapCenter = function() {
  var user_lat = map.getCenter().lat();
  var user_long = map.getCenter().lng();
  return [user_lat, user_long];
}


function getSatsNearMapCenter() {
  var geocoder = new google.maps.Geocoder;
  var lat = map.getCenter().lat()
  var lng = map.getCenter().lng()

  var latlng = {lat: lat, lng: lng};
  geocoder.geocode({'location': latlng}, getNearbySats);
}
