//下拉菜单
$(document).ready(function() {
    $('.dropdown-toggle').dropdown('toggle');
    $('#submit').click(check_login);
    $('#course_tab li a').click(function(e) {
        e.preventDefault()
        $(this).tab('show')
    })
    $('*[role=revise]').click(function() {
        $(this).parent()
            .siblings("*[role='info-cotent']")
            .find("*[role='info']")
            .hide()
            .siblings()
            .show()
        $(this).hide().siblings()
            .show()

    })
    $("*[role='cancel'], *[role='conform']").click(function() {

        $(this).parent()
            .css('display', 'none')
            .siblings()
            .show()
            .parent()
            .siblings("*[role='info-cotent']")
            .find("*[role='info']")
            .show()
            .siblings()
            .hide()
    })
})

function check_login() {
    postAjax(
        $('#loginform').serialize(), '/login').done(function(res) {
        if (res.access == 'true') {
            window.location.reload();
        } else {

        }
    }).fail(function(res) {
        console.log('fail');
    });
}

function postAjax(data, url) {
    return $.ajax({
        data: data,
        type: 'POST',
        dataType: "json",
        url: url
    })
}
