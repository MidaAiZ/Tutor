//下拉菜单
$(document).ready(function() {
    $('.dropdown-toggle').dropdown('toggle');
    $('#submit').click(check_login);
    $('#course_tab li a').click(function(e) {
        e.preventDefault()
        $(this).tab('show')
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
