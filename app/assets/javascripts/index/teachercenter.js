$(document).ready(function() {
    $('#handbook-modal').modal({
        keyboard: false
    }).unbind('click');
    $('#conform-btn').click(function() {
        $('#new-course-form').removeClass('hidden').hide().fadeIn(1000);
        $('#handbook-modal').modal('hide')
    })
    $('#agree-btn').click(function() {
        if ($(this).attr('checked')) {
            $(this).removeAttr('checked');
            $('#conform-btn').attr('disabled', 'true');
        } else {
            $(this).attr('checked', 'checked');
            $('#conform-btn').removeAttr('disabled');
        }

    })
});
