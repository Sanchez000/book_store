/*
$('body').on('click', '.dropdown-toggle', function (event) {
    $('.dropdown-toggle').dropdown();
    event.preventDefault();
});
*/
$('.dropdown-toggle').dropdown();
$('#myCarousel').carousel({
		interval:   0//4000
});

$('.dropdown-menu').on('click', function(e){
  link = $(e.target).prop('href');
  selected_name = $(e.target).text();
  $('#dropdownMenuLink').text(selected_name);
});

$('#description').css('overflow', 'hidden');
$('#description').readmore({
		embedCSS: false,
		collapsedHeight: 165,
		startOpen: false,
		moreLink: '<a href="#" class="in-gold-500 ml-10">Read More</a>',
		lessLink: '<a href="#" class="in-gold-500 ml-10">Read less</a>'
	});
