$(document).ready(function () {
     /*左边的开放时间几个动画*/
    $(".service-box").mouseenter(function(){
        $(this).find(".service-pic").stop().animate({marginTop:"5px",marginBottom:"10px"},200);
    });
    $(".service-box").mouseleave(function(){
        $(this).find(".service-pic").stop().animate({marginTop:"10px",marginBottom:"10px"},200);
    });
    //文字滚动1
    speed = 100; //数字越大滚得越慢
    var htab = document.getElementById("myTab_Content0");
    var htab1 = document.getElementById("hdemo1");
    var htab18 = document.getElementById("hdemo18");

    htab18.innerHTML = htab1.innerHTML;
    htab.scrollTop = htab1.offsetHeight;

    function Marquee() {
        if(htab.scrollTop >= htab1.offsetHeight) {
            htab.scrollTop -= htab18.offsetHeight;
        } else {
            htab.scrollTop += 1;
        }
    }
    var MyMar = setInterval(Marquee, speed);
});