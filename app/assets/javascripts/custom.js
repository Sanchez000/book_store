$(document).ready(function () {
	$('#description').readmore({
		collapsedHeight: 165,
		moreLink: '<a href="#" class="in-gold-500 ml-10">Read More</a>',
		lessLink: '<a href="#" class="in-gold-500 ml-10">Read less</a>'
	});
});

$('body').on('click', '.img-link', function (event) {
  $('#main_img').attr('src',$(this).children().attr('src'));
 	event.preventDefault();
} );

$('.dropdown-toggle').dropdown();
$('#myCarousel').carousel({
		interval:   0
});

$('.dropdown-menu').on('click', function(e){
  link = $(e.target).prop('href');
  selected_name = $(e.target).text();
  $('#dropdownMenuLink').text(selected_name);
});
