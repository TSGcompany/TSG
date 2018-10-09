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

