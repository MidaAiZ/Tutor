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
    $("*[role='courses-selection'] li[role*='condition'] a").click(function() {
        //别改这段代码，否则会后悔的 2016/12/08
        var $fatherNode = $(this).parent();
        $fatherNode.hasClass('active') ? $fatherNode.removeClass('active') : $fatherNode.addClass('active');
        if ($(this).attr('data-target') === '#all') {
            $fatherNode.siblings().removeClass('active');
        } else {
            $fatherNode.siblings().filter("li[role*='all']").removeClass('active');
        }
        var target,
            targetStage = [],
            $targetList = [],
            $courseList = $($("#course-tab li[role='presentation'].active a").attr('href'))
            .children('table').children('tbody').children('tr');
        $fatherNode.siblings().andSelf().filter('.active').each(function() {
            target += ' ' + $(this).children('a').data('target').replace(/\#/g, '');
        });
        if (!target) {
            $courseList.hide();
            return
        }
        if (target.indexOf('all') !== -1) {
            $courseList.show();
            return
        }

        for (var i in target.split(' ')) {
            targetStage.push("tr[data-stage*='" + target.split(' ')[i] + "']");
        }
        for (j in targetStage) {
            $targetList.push($courseList.filter(targetStage[j]));
        }
        $courseList.hide();
        for (e in $targetList) {
            $targetList[e].show();
        }
    })

    //     //处理预约课程
    // $('#course_refuse_btn').click(function() {
    //     $.post({
    //         data: $('#course_refuse_form').serialize(),
    //         url: '/teachercenter/dispose_appoint_course',
    //         dataType: 'html',
    //         error: null,
    //         success: function(res) {
    //             document.write(res)
    //         }
    //     })
    // })
    // $('#course_accept_btn').click(function() {
    //     $.post({
    //         data: $('#course_refuse_form').serialize(),
    //         url: '/teachercenter/dispose_appoint_course',
    //         dataType: 'html',
    //         error: null,
    //         success: function(res) {
    //             document.write(res)
    //         }
    //     })
    // });
});
