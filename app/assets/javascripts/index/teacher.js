$(document).ready(function() {
    $('#appoint-course').modal({
        'show': false
    }).unbind('click');
    $('#conform').click(function() {
        $('#handbook').hide();
        $('#modal-content').removeClass('hidden').hide().slideDown(1000);;
    })
    $('#agree').click(function() {
            if ($(this).attr('checked')) {
                $(this).removeAttr('checked');
                $('#conform').attr('disabled', 'true');
            } else {
                $(this).attr('checked', 'checked');
                $('#conform').removeAttr('disabled');
            }

        })
        // $('#appoint-submit').click(function() {
        //     postAjax($('#new_course').serialize(), '/courses/create')
        //         .done(function(res) {
        //             alert('done!!')
        //         })
        //         .fail(function(res) {
        //             alert('fail!!')
        //         })
        //     return false;
        // })
        // $('#appoint-submit').click(function() {
        //     $('#appoint-course').modal({
        //         'show': false
        //     });
        //     $('#new_course').find('input[type=*]').val('');
        //
        //     return false;
        // });

})
