/*资讯栏导航切换动画*/
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
       /* $(".information-nav").mouseover(function (){  
	     $(this).css("background-color","#99E0F2");
	    }).mouseout(function (){  
        	 	$(this).css("background-color","#99E0F2");
        });  */
	});	