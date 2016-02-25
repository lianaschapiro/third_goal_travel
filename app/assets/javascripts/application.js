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
//= require_tree .
$(document).ready(function(){

  // Select destination by region 
  $('#menu_select').on('change', function() {window.location.pathname = $(this).val()});

  // Fade out flash notices
  $('#flash').delay(1200).fadeOut(1000);

});

// Populates latitude and longitude in post form
function populateInputs(pos) {
  document.getElementById("post_latitude").value=pos.lat()
  document.getElementById("post_longitude").value=pos.lng();
}

// Geocoder function that gets latitude and longitude from address
function geocodeAddress(geocoder, resultsMap, address) {
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      resultsMap.setZoom(15);
       var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
      // sets hidden form_for fields in the "new report modal" to the latitude/longitude coordinates
      populateInputs(marker.position)
      document.getElementById("post_address").value = address;
      // changes address search button to say "Location Found!"
      document.getElementById("submit").setAttribute("value", "Location Found!");
      // changes address search button text back to "Search"
      setTimeout(function(){ 
        document.getElementById("submit").setAttribute("value", "Search"); }, 2000);
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

function openRestaurantModal() {
  $('#hotel_reviews').fadeOut();
  $('#other_reviews').fadeOut();
  $('#restaurant_reviews').delay(400).fadeIn(300);
}
function openHotelModal() {
  $('#other_reviews').fadeOut();
  $('#restaurant_reviews').fadeOut();
  $('#hotel_reviews').delay(400).fadeIn(300);
}
function openOtherModal() {
  $('#restaurant_reviews').fadeOut();
  $('#hotel_reviews').fadeOut();
  $('#other_reviews').delay(400).fadeIn(300);
}




// Creating reviews (posts)
function openPostModal() {
  $('#restaurant_reviews').fadeOut();
  $('#hotel_reviews').fadeOut();
  $('#other_reviews').fadeOut();
  $('#post_modal').delay(400).fadeIn(300);
}
function closePostModal() {
  $('#post_modal').fadeOut(300);
}


// Creating message board posts
function openBoardpostModal() {
  $('#outer_boardpost_modal').fadeIn(200);
}

function closeBoardpostModal() {
  $('#outer_boardpost_modal').fadeOut(200);
}