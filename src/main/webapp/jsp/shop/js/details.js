 $(document).ready(function () {
 	/*当鼠标放在书本上时书本放大*/
$(".tsg_picture").mouseenter(function(){
    $(this).children("img").animate({width:"200%",height:"200%",marginTop:"-50%",marginLeft:"-50%"})   
}).mouseleave(function(){
    $(this).children("img").animate({width:"100%",height:"100%",marginTop:0,marginLeft:0}) 
})
});