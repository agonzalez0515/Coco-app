var map;


var initMap = function() {
 map = new google.maps.Map(document.getElementById('map'), {
   center: {lat: 33.999656, lng: -118.087183},
   zoom: 5
 });
$('#date').on('submit', function(e) {
  e.preventDefault();
  $.getJSON('/events/new?'+$(e.target).serialize(), null, function(response) {
    for (var i = 0; i < response.length; i++) {

      var url = 'http://maps.googleapis.com/maps/api/geocode/json?address='+encodeURI(response[i].address)+'&sensor=false';
      $.getJSON(url, null, function(data) {
        if (data.status != "ZERO_RESULTS") {
          var p = data.results[0].geometry.location
          var latlng = new google.maps.LatLng(p.lat, p.lng);
          new google.maps.Marker({
            position: latlng,
            map: map
          });
        }
      });
    }
  });
})
