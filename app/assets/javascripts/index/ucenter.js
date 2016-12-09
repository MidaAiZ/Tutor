$(document).ready(function() {
    $('#comment').modal('hide');
    $("span[role='mark']").click(function() {
        var index = $(this).index() + 1;
        console.log(index);
        $(this).nextAll().removeClass('glyphicon-star').addClass('glyphicon-star-empty').end()
            .siblings().andSelf().slice(0, index).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
        $(this).parent().siblings('input').val(index);
    })

})
