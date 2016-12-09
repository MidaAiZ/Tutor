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


    setFlowShow($("li[role='flow-label']"));

});

function setFlowShow($flowEle) {
    var flowParams = {
        width: $flowEle.parent().width(),
        height: $flowEle.parent().height(),
        length: $flowEle.length,
    };

    //使每一个元素进入循环
    for (var i = 0; i < flowParams.length; i++) {
        setTimeout(function(index) {
            return function() {
                showFlow($flowEle.slice(index, index + 1));
            }
        }(i), 1000 * setRandom());
    }

    //根据元素个数返回一个随机数
    function setRandom() {
        return Math.round(Math.random() * flowParams.length)
    }

    //设置离父级元素左边的距离
    function setFlowPositionX($ele) {
        return privateWidth = Math.round(Math.random() * (flowParams.width - $ele.width()));
    }

    //设置上升速度
    function setSpeed() {
        return (Math.random() + 1) * (flowParams.height * 10)
    }

    function showFlow($ele) {
        var flowSpeed = setSpeed();
        $ele.animate({
            left: setFlowPositionX($ele)
        }, 0).animate({
            opacity: 'show',
            top: '80%'
        }, flowSpeed * 0.2, "linear").animate({
            top: '20%'
        }, flowSpeed * 0.6, "linear").animate({
            opacity: 'hide',
            top: 0
        }, flowSpeed * 0.2, "linear").animate({
                opacity: 'hide',
                top: '100%',
                left: 0
            }, 0,
            function() {
                $ele.finish(true).attr('style', '');
            });
        //实现鼠标进入停止动画，鼠标移出继续动画的功能
        $ele.mouseenter(function() {

        });
        $ele.mouseout(function() {

        })
        setTimeout(function() {
            showFlow($ele)
        }, 2000 * setRandom() + flowSpeed)
    }
}
