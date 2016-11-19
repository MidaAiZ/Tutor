//下拉菜单
$(document).ready(function() {
    $('.dropdown-toggle').dropdown('toggle');
    $('#submit').click(check_login);
    // $('#loginform').submit(function() {
    //     check_login();
    // })
})

function check_login() {
    postAjax(
        $('#loginform').serialize(), 'login').done(function(res) {
        if (res.access !== 'false') {
            window.location.reload();
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
