
// $('.sat-locations').on('click', "li", function(){
//   // var data = $(this).val();
//   console.log("hello");
// })

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
  }
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

var getMapCenter = function() {
  var user_lat = map.getCenter().lat();
  var user_long = map.getCenter().lng();
  return [user_lat, user_long];
}
// function getSatsNearMapCenter() {
//   var geocoder = new google.maps.Geocoder;
//   var lat = map.getCenter().lat()
//   var lng = map.getCenter().lng()
//
//   var latlng = {lat: lat, lng: lng};
//   geocoder.geocode({'location': latlng}, getNearbySats);
// }

// $(document).ready(function(){
//   voteForPost();
// })

// var voteForPost = function(){
//   $(".testing1").on("click", function(event){
//     event.preventDefault();
//     var $button = $(this);
//     var method = $button.attr("method");
//     var url = $button.attr("action");

//     console.log(method)
//     console.log(url)

//     $.ajax({
//       method: method,
//       url: url,
//       // data: $button.parent().serialize
//     }).done(function(response){
//       console.log(response);
//     }).fail(function(err) {
//       console.log(err)
//     })
//   })
// }
