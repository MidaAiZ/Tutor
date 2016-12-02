//下拉菜单
$(document).ready(function() {
    $('.dropdown-toggle').dropdown('toggle');
    $('#course_tab li a').click(function(e) {
        e.preventDefault()
        $(this).tab('show')
    })

})

//登录功能
$(document).ready(function() {
    $('#submit').click(check_login);
})

//个人中心修改
$(document).ready(function() {

    //样式改变
    $('*[role=revise]').click(function() {
        //更改内容
        var currentInfo = $(this).parent()
            .siblings("*[role='info-cotent']")
            .find("*[role='info']")
            .text();
        console.log(currentInfo)
            //bug：获取不到currentInfo
        $(this).parent()
            .siblings("*[role='info-cotent']")
            .find("*[role='edit']")
            .val(currentInfo);

        //显示和隐藏
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
        //后台交互 改变内容
    $("*[role='conform']").click(function() {
        var $reviseEle = $(this).parent().siblings().parent().siblings("*[role='info-cotent']");
        var inputType = $reviseEle.find("*[role='edit']").attr('type'),
            name = $reviseEle.find("*[role='info']").attr('name'),
            value = $reviseEle.find("*[role='edit']").val();

        var $ajaxForm = setAjaxForm(inputType, name, value);

        reviseInfo($ajaxForm, $(this));
    })
})

//登录功能后台交互
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

//个人中心修改后台交互
function reviseInfo($ajaxForm, ele) {
    console.log($ajaxForm)
    postAjax($ajaxForm.serialize(), 'usercenter/revise').done(function(res) {
        console.log(res)
        ele.parent()
            .siblings()
            .parent()
            .siblings("*[role='info-cotent']")
            .find("*[role='info']")
            .text(res.realname);

    }).fail(function(res) {

    });
    $ajaxForm.empty();
}


function postAjax(data, url) {
    return $.post({
        data: data,
        dataType: "json",
        url: url
    })
}

//构建用于ajax交互的表单
function setAjaxForm(inputType, name, value) {
    var $form = $("<form id='ajaxForm'></form>"),
        input = '<input type=' + inputType + ' name=' + name + ' value=' + value + '>';
    $form.append($(input));
    return $form;
}
