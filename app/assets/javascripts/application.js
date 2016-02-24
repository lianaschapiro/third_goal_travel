// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function geocodeAddress(geocoder, resultsMap, address) {
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      resultsMap.setZoom(15);
       var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
      // sets marker position to the geocoded latitude/longitude
      var post_lng = marker.position.lng();
      var post_lat = marker.position.lat();
      // sets hidden form_for fields in the "new report modal" to the latitude/longitude coordinates
      document.getElementById("post_latitude").setAttribute("value", post_lat); 
      document.getElementById("post_longitude").setAttribute("value", post_lng);
      document.getElementById("post_address").setAttribute("value", address);
      console.log(post_lat)
      console.log(post_lng)
      // changes address search button to say "Address Found!"
      // document.getElementById("submit").setAttribute("value", "Address Found!");
      // changes address search button text back to "Search"
      // setTimeout(function(){ 
        // document.getElementById("submit").setAttribute("value", "Search"); }, 3000);
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}



// Creating Message board posts
function openBoardpostModal() {
  $('#outer_boardpost_modal').fadeIn(200);
}

function closeBoardpostModal() {
  $('#outer_boardpost_modal').fadeOut(200);
}