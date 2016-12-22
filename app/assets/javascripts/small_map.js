
var directionsDisplay;
var directionsService;
var dirMap;
var clickLoc;
var satLoc;
var sat_lat;
var sat_long;
var clickListener;
var click_lat;
var click_long;
var new_marker;
var homeAddress;
var geocoder;

function initialize() {
  sat_lat = $('#sat_lat').val();
  sat_long = $('#sat_long').val();
  satLoc = new google.maps.LatLng(sat_lat, sat_long);

  directionsService = new google.maps.DirectionsService();

  directionsDisplay = new google.maps.DirectionsRenderer();
  var mapOptions = {
    zoom: 10,
    center: satLoc
  }
  dirMap = new google.maps.Map(document.getElementById('small_map'), mapOptions);
  directionsDisplay.setMap(dirMap);
  directionsDisplay.setPanel(document.getElementById('directionsPanel'));

  var pinIcon = {
      url: "https://s30.postimg.org/68ej2wfu9/marker3.png",
      size: null, /* size is determined at runtime */
      origin: new google.maps.Point(0,0), /* origin is 0,0 */
      anchor: null, /* anchor is bottom center of the scaled image */
      scaledSize: null
    };

    new_marker = new google.maps.Marker({
      position: satLoc,
      icon: pinIcon,
      map: dirMap
    });

    clickListener = google.maps.event.addListener(dirMap, 'click', function( event ){
      click_lat = event.latLng.lat();
      click_long = event.latLng.lng();
      clickLoc = new google.maps.LatLng(click_lat, click_long);
      calcRoute();
    });
}

function calcRoute() {
  var selectedMode = 'DRIVING'//document.getElementById('mode').value;
  var request = {
      origin: clickLoc,
      destination: satLoc,

      travelMode: google.maps.TravelMode[selectedMode]
  };
  directionsService.route(request, function(response, status) {
    if (status == 'OK') {
      directionsDisplay.setDirections(response);
    }
  });
}
