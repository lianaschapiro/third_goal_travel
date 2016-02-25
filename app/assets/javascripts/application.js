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

// Opens different review sections
// Restaurant reviews
function openRestaurantModal() {
  $('.tab.one').css({"border-top":"solid 2px #f1f1f1", "border-right":"solid 2px #f1f1f1", "border-left":"solid 2px #f1f1f1", "border-bottom":"none"});
  $('.tab.two').css({"border-top":"none", "border-right":"none", "border-left":"none", "border-bottom":"solid 2px #f1f1f1"});
  $('.tab.three').css({"border-top":"none", "border-right":"none", "border-left":"none", "border-bottom":"solid 2px #f1f1f1"});
  $('#post_modal').hide();
  $('#hotel_reviews').hide();
  $('#other_reviews').hide();
  $('#restaurant_reviews').show();

};
// Hotel reviews
function openHotelModal() {
  $('.tab.one').css({"border-top":"none", "border-right":"none", "border-left":"none", "border-bottom":"solid 2px #f1f1f1"});
  $('.tab.two').css({"border-top":"solid 2px #f1f1f1", "border-right":"solid 2px #f1f1f1", "border-left":"solid 2px #f1f1f1", "border-bottom":"none"});
  $('.tab.three').css({"border-top":"none", "border-right":"none", "border-left":"none", "border-bottom":"solid 2px #f1f1f1"});
  $('#outer_review_modal').hide();
  $('#other_reviews').hide();
  $('#restaurant_reviews').hide();
  $('#hotel_reviews').show();
};
// Other reviews
function openOtherModal() {
  $('.tab.one').css({"border-top":"none", "border-right":"none", "border-left":"none", "border-bottom":"solid 2px #f1f1f1"});
  $('.tab.two').css({"border-top":"none", "border-right":"none", "border-left":"none", "border-bottom":"solid 2px #f1f1f1"});
  $('.tab.three').css({"border-top":"solid 2px #f1f1f1", "border-right":"solid 2px #f1f1f1", "border-left":"solid 2px #f1f1f1", "border-bottom":"none"});
  $('#outeR_review_modal').hide();
  $('#restaurant_reviews').hide();
  $('#hotel_reviews').hide();
  $('#other_reviews').show();
};

// Creating reviews
function openReviewModal() {
  $('.tab.one').css({"border-top":"none", "border-right":"none", "border-left":"none", "border-bottom":"solid 2px #f1f1f1"});
  $('.tab.two').css({"border-top":"none", "border-right":"none", "border-left":"none", "border-bottom":"solid 2px #f1f1f1"});
  $('.tab.three').css({"border-top":"none", "border-right":"none", "border-left":"none", "border-bottom":"solid 2px #f1f1f1"});
  $('#restaurant_reviews').hide();
  $('#hotel_reviews').hide();
  $('#other_reviews').hide();
  $('#outer_review_modal').show();
}
function closeReviewModal() {
  $('.tab.one').css({"border-top":"solid 2px #f1f1f1", "border-right":"solid 2px #f1f1f1", "border-left":"solid 2px #f1f1f1", "border-bottom":"none"});
  $('.tab.two').css({"border-top":"none", "border-right":"none", "border-left":"none", "border-bottom":"solid 2px #f1f1f1"});
  $('.tab.three').css({"border-top":"none", "border-right":"none", "border-left":"none", "border-bottom":"solid 2px #f1f1f1"});
  $('#outer_review_modal').hide();
  $('#hotel_reviews').hide();
  $('#other_reviews').hide();
  $('#restaurant_reviews').show();
}

// Creating message board posts
function openBoardpostModal() {
  $('#outer_boardpost_modal').fadeIn(200);
}

function closeBoardpostModal() {
  $('#outer_boardpost_modal').fadeOut(200);
}