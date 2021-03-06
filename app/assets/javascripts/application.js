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
//= require zeroclipboard
//= require bootstrap-sprockets
//= require owl.carousel
//= require_tree .

$(document).ready(function() {
	$(".js-add-budget").on("click", setBudget);


	var clip = new ZeroClipboard($("#d_clip_button"))

	$("#clear-test").on("click", function(){
	$("#fe_text").val("www.belovedapp.co/:user_id/hellofriend");
	$("#testarea").val("");
	$(".my_clip_button").data("clipboard-text", "www.belovedapp.co/:user_id/hellofriend");

	});

	function setBudget (theEvent) {
	theEvent.preventDefault();

	console.log("Set Budget Click");

	var grand_total = $(".js-grand-total").text();
	var budget = $(".js-budget").val();
	var budgetLeft = budget- grand_total;

	$('.js-budget-left').text(budgetLeft)	
	}
		
});


//snapchat filter

// $(document).ready(function(){

// $('button').on('click', function(){
// 	html2canvas($(".image-preview-wrap"), {
//     	onrendered: function(canvas) {
//        		var myImage = canvas.toDataURL("image/png");
// 			$('.lightbox').fadeIn(200);
// 			$('.new-image').attr('src', myImage).fadeIn(200);
//     	}
// 	});
// });

// // $('.lightbox').css('display');

// $('.custom-text').keyup(
// function(){
// 	console.log("banana");
//   var value = $('.custom-text').val();
//   $('.image-message').text(value);
// });
// });

// $('.message-form').submit(function(e){
// e.preventDefault;
// return false;
// });

// MightyScroll Mastheader
$.fn.scrollFun = function () {
	$(this).click(function (e) {
		var h = $(this).attr('href'),
			target;

		if (h.charAt(0) == '#' && h.length > 1 && (target = $(h)).length > 0) {
			var pos = Math.max(target.offset().top, 0);
			e.preventDefault();
			$('body,html').animate({
				scrollTop: pos
			}, 'slow', 'swing');
		}
	});
};
$('.scroll').scrollFun();

//Text Scroll

$(window).scroll(function() {
  var scroll = $(window).scrollTop();
	$("header .expanding-text").css({
		'line-height': 1.25 + (scroll/400),
		'opacity': 1 - (scroll/500),
		"-webkit-filter": "blur(" + (scroll/200) + "px)",
		filter: "blur(" + (scroll/200) + "px)"

	});
});


// Image Carousel  
$(document).ready(function() {
  $("#owl-demo").owlCarousel({
 
      autoPlay: 3000, //Set AutoPlay to 3 seconds
 
      items : 4,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3]
 
  });
 
});
