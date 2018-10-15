/*选项卡*/
$(document).ready(function () {
    $(".middle-nav").mouseover(function (){
        $(this).css("background-color","#99E0F2");
        $("#growTask").show();
        $("#dayTask").hide();
    }).mouseout(function (){
        $(this).css("background-color","#DCDCDC");
    });
    $(".information-nav").mouseover(function (){
        $(this).css("background-color","#99E0F2");
        $("#dayTask").show();
        $("#growTask").hide();
    }).mouseout(function (){
        $(this).css("background-color","#DCDCDC");
    });

    /*左边的开放时间几个动画*/
    $(".service-box").mouseenter(function(){
        $(this).find(".service-pic").stop().animate({marginTop:"5px",marginBottom:"10px"},200);
    });
    $(".service-box").mouseleave(function(){
        $(this).find(".service-pic").stop().animate({marginTop:"10px",marginBottom:"10px"},200);
    });

});