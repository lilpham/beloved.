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
//= require_tree .
//= require zeroclipboard



$(document).ready(function() {
	$(".js-add-budget").on("click", setBudget);


	var clip = new ZeroClipboard($("#d_clip_button"))

	$("#clear-test").on("click", function(){
	$("#fe_text").val("localhost:3000/:user_id/hellofriend");
	$("#testarea").val("");
	$(".my_clip_button").data("clipboard-text", "localhost:3000/:user_id/hellofriend");

	});
	
var budgetLeft  

	function setBudget (theEvent) {
	theEvent.preventDefault();

	console.log("Set Budget Click");

	var budget = $(".js-budget").val();

		var budgetLeft  = parseInt(budget - "#{@grand.total}");
		console.log(budgetLeft)
	}

	$('.js-budget-left').append(budgetLeft)
});

<!-- user customizes input on template -->
// $(function () {
//   var $text = $('#custom-text');
//   var $input = $('#user-input');
//   $input.on('keydown', function () {
//     setTimeout(function () {
//       $text.html($input.val());
//     }, 0);
//   });
// })
$(document).ready(function(){
    $('.message-submit-button').on('click', function(){
    html2canvas($('.image-preview-wrap'), {
      onrendered: function(canvas) {
        var myImage = canvas.toDataURL('image/png');
        $('.lightbox').fadeIn(200);
        $('.new-image').attr('src', myImage).fadeIn(200);
      }
    });
  });

    $('.closebox').on('click', function(){
    $('.lightbox').css('display', 'none');
  });

$('.custom-text').keyup(
    function(){
      var value = $(this).val();
      $('.image-message').text(value);
    }
  );

$('.template-form').submit(function(e){
	e.preventDefault;
	return false;
});
  });

<!-- user can save the image -->

