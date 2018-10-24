/*五星评分*/
    $(function(){
        var wjx_none = '☆'; // 空心五角星
        var wjx_sel = '★'; // 实心五角星
 
        //鼠标移进变实星
        $(".comment li").on("click",function(){
            $(this).text(wjx_sel).prevAll("li").
            text(wjx_sel).end().nextAll().text(wjx_none);
        });
 
        //鼠标移出变空星
        $(".comment li").on("click",function(){
           if($("li.current").length === 0){
                $(".comment li").text(wjx_none);
           }else{
               $("li .current").text(wjx_sel).prevAll().text(wjx_sel).end().nextAll().text(wjx_none);
           }
        });
 
        //鼠标点击保持当前状态.
        $(".comment li").on("click",function(){
            $(this).attr("class","current").siblings().removeClass("current");
        });


        $("div #tsg_among").mouseover(function(){
            $(this).css("border","1px solid #D51938")

        });
        $("div #tsg_among").mouseout(function() {
          $(this).css("border","1px solid #ccc")
        });



    });
    /*分页*/
  function page(){
  var contain=$(".page_num_container");
  var ul= contain.children("ul");
  var li = ul.children("li");
  var length= li.length;
  var index=0;
  var leftIndex=0;
  var prev_btn= contain.siblings(".prev_page");
  var next_btn= contain.siblings(".next_page ");
  ul.css("width",li.outerWidth()*length);
  change_page(index);
  function change_page(eqindex){
  if(eqindex<0 )
  {
  index=0;
  }
  else if(eqindex>=length ){
  index=length-1;
  }
  if(index-4<=0){
  leftIndex=0;
  }
  else if(index>length-10)
  {
  leftIndex=Math.ceil(length/2);
  }
  else{
  leftIndex=index-4;
  }
  ul.animate({"left":"-"+leftIndex*li.outerWidth()+"px"},200);
  li.eq(index).addClass("active").siblings(li).removeClass("active");
  }
  prev_btn.click(function(){
  index=index-1;
  change_page(index);
  })
  next_btn.click(function(){
  index=index+1;
  change_page(index);
  })
  li.click(function(){
  index=$(this).index();
  change_page(index);
  })
 }
 page()

