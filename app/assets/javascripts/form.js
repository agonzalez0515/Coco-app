// $( document ).on('turbolinks:load', function() {
//
// })
//
//
// var map;
// var markers = [];
//
// var initMap = function() {
//   map = new google.maps.Map(document.getElementById('map'), {
//     center: {lat: 33.999656, lng: -118.087183},
//     zoom: 5
//   });
//
//   $('#date').on('submit', fetchParams)
//   var infoWindow = new google.maps.InfoWindow({map: map});
//
//
//
//   // Try HTML5 geolocation.
//   if (navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition(function(position) {
//       var pos = {
//         lat: position.coords.latitude,
//         lng: position.coords.longitude
//       };
//
//       infoWindow.setPosition(pos);
//       infoWindow.setContent('You are here.');
//       map.setCenter(pos);
//     }, function() {
//       handleLocationError(true, infoWindow, map.getCenter());
//     });
//   } else {
//     // Browser doesn't support Geolocation
//     handleLocationError(false, infoWindow, map.getCenter());
//   }
// };
//
//
// function fetchParams(e) {
//   e.preventDefault();
//   var date = $('#date').serialize();
//   var ajax_lat = map.getCenter().lat();
//   var ajax_long = map.getCenter().lng();
//   // $.getJSON('/sats?'+date, null, fetchSats);
//   $.getJSON('/sats?'+date+'&user_lat='+ajax_lat+'&user_long='+ajax_long, null, fetchSats);
// }
//
// function fetchSats(response) {
//   deleteMarkers();
//   for (var i = 0; i < response.length; i++) {
//     var sat = response[i];
//     placeMarkers(sat.latitude, sat.longitude)
//     //Append input into form with sat id
//     $('.sat-locations').append('<li><input type="radio" name="sat_id" value="'+sat.id+'" class="with-gap" id="'+sat.id+'" ><label for="'+sat.id+'">'+sat.address+'</label></li>' )
//
//   }
// }
//
// function placeMarkers(lat, lng) {
//
//   var latlng = new google.maps.LatLng(lat, lng);
//   new_marker = new google.maps.Marker({
//     position: latlng,
//     map: map
//   });
//   markers.push(new_marker);
// }
//
// // Sets the map on all markers in the array.
// var setMapOnAll = function(map) {
//   for (var i = 0; i < markers.length; i++) {
//     markers[i].setMap(map);
//   }
// }
//
// // Removes the markers from the map, but keeps them in the array.
// var clearMarkers = function() {
//   setMapOnAll(null);
// }
//
// // Deletes all markers in the array by removing references to them.
// var deleteMarkers = function() {
//   clearMarkers();
//   markers = [];
// }
//
// var getMapCenter = function() {
//   var user_lat = map.getCenter().lat();
//   var user_long = map.getCenter().lng();
//   return [user_lat, user_long];
// }
//
//
//
// // $(document).ready(function() {
// //
// // });
