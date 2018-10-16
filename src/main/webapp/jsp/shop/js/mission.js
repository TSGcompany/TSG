$(document).ready(function () {
     /*左边的开放时间几个动画*/
    $(".service-box").mouseenter(function(){
        $(this).find(".service-pic").stop().animate({marginTop:"5px",marginBottom:"10px"},200);
    });
    $(".service-box").mouseleave(function(){
        $(this).find(".service-pic").stop().animate({marginTop:"10px",marginBottom:"10px"},200);
    });

});