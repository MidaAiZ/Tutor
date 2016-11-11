// = require bootstrap/carousel

$(document).ready(function() {
    $('#condition-header-1').click(function(event) {
        event.stopPropagation();
        $('#condition-menu-1').slideToggle(100, 'linear', function() {
            $(this).attr('expand') === 'false' ? $(this).attr('expand', 'ture') : $(this).attr('expand', 'false');
        });
    });
    $('.carousel').carousel({
        interval: 2000
    });
});
