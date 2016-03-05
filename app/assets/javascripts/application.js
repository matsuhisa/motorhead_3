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

$(function($) {
  $('.js_select-books').on('change', function(){
    var book_id = $('.js_select-books option:selected').val();
    if(book_id){
      var json_url = '/books/' + book_id + '.json';
      console.log(json_url);
      $.ajax({url: json_url, type: 'GET'}).done(function(response){
        if(response.status == 'success'){
          console.log(response.name);
        }
      });
    }

  });
});
