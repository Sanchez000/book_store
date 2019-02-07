$('body').on('click', '.dropdown-toggle', function (event) {
    $('.dropdown-toggle').dropdown();
    event.preventDefault(); 
});

