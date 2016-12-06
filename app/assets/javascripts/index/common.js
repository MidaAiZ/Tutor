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
                .hide()
                .siblings()
                .show()
                .parent()
                .siblings("*[role='info-cotent']")
                .find("*[role='info']")
                .show()
                .siblings()
                .hide();
        })
        //后台交互 改变内容
    $("*[role='conform']").click(function() {
        var $reviseEle = $(this).parent().siblings().parent().siblings("*[role='info-cotent']");
        var $inputEle = $reviseEle.find("*[role='edit']").clone();

        var $ajaxForm = setAjaxForm($inputEle);
        // if ($(this).data('target') === 'ucenter') {
        reviseInfo($ajaxForm, $(this).data('target'), $(this));
        // } else if ($(this).data('target') === 'teacenter') {
        // reviseInfo($ajaxForm, 'teachercenter/revise', $(this));
        // }
    })
})

//登录功能ajax后台交互
function check_login() {
    postAjax($('#loginform').serialize(), '/login')
        .done(function(res) {
            if (res.access == 'true') {
                window.location.reload();
            } else {

            }
        })
        .fail(function(res) {
            console.log('fail');
        });
}

//个人中心修改ajax后台交互
function reviseInfo($ajaxForm, url, ele) {
    postAjax($ajaxForm.serialize(), url).done(function(res) {
        var $reviseEle = ele.parent()
            .siblings()
            .parent()
            .siblings("*[role='info-cotent']")
            .find("*[role='info']")
        attr = $reviseEle.data('attr');
        $reviseEle.text(res[attr]);
    }).fail(function(res) {

    });
    $ajaxForm.remove();
}


function postAjax(data, url) {
    return $.post({
        data: data,
        dataType: "json",
        url: url
    })
}

//构建用于ajax交互的表单
function setAjaxForm($inputEle) {
    var $form = $("<form id='ajaxForm'></form>");
    $form.append($inputEle);
    return $form;
}
