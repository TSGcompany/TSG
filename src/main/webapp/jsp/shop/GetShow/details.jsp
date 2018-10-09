<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>图书馆详情页</title>
		<link rel="stylesheet" type="text/css" href="../css/mission.css" />
		<link rel="stylesheet" type="text/css" href="../css/details.css" />
		<script src="../js/details.js"></script>
	</head>
	<body>
		
		<div class="tsg_details">
			<!--
            	作者：offline
            	时间：2018-09-25
            	描述：右边图片
           -->      
           <div class="tsg_picture">
                  <img class="circle" src="../img/ts1.jpg" width="300px" height="350px" />
                   </div>
		<!--
        	作者：offline
        	时间：2018-09-25
        	描述：左边简介
       -->
		<div class="synopsis">	
				<p>愿你的青春不负梦想</p>
		</div>
		<!--
        	作者：offline
        	时间：2018-09-25
        	描述：借阅按钮
        -->
		<div id="borrow">	
			<a href="#">借阅</a>
			   </div>
		<!--
        	作者：offline
        	时间：2018-09-25
        	描述：预约按钮
        -->
		<div id="make">			
			<a href="#">预约</a>
			
		  </div>
		</div>	
	</div>
		<!--最外边框-->
      <div class="rectan">
      	<!--图书排行榜小框-->
      <div class="kanle">
      	<h3>图书排行榜</h3>
      </div>
      	<!--最左边长条框-->
      <div class="list">
      	<!--第一部分-->
      	<div class="book1">
      		<img src="../img/ts_img/ts2.jpg"/>
      		<div class="make1">
      			<div class="make1_fex1"><p>林清玄</p></div>
      			<div class="make2_fex2"><p>从容的底气</p></div>
      		</div>
      	 </div>    
      
      	
      	
       </div>
       
       <!--<div class="right_evaluate">-->
       	<div class="tab">
        <div id="box">
            <!--这个ul为选项卡的菜单，提供选择项，并且设置其中一个li为默认样式-->
            <ul>
                <li class="active">新闻</li>
                <li>社会</li>
            </ul>
            <!--这个div为选项卡的内容，显示不同菜单的不同内容，并且设置其中一个div为可见，其他隐藏-->
            <div id="content">
                <div style="display: block;">新闻</div>
                <div>社会</div>
            </div>
        </div>
        </div>

    <script type="text/javascript">
    window.onload=function(){
        var oBox=document.getElementById('box');
        var aLi=oBox.getElementsByTagName('li');
        var oCon=document.getElementById('content');
        var aDiv=oCon.getElementsByTagName('div');

        for(var i=0;i<aLi.length;i++){
            aLi[i].index=i;   //为每个li添加对应的索引index
            aLi[i].onclick=function(){   //循环为每个li添加onclick事件
            for(var i=0;i<aLi.length;i++){
                aLi[i].className='';  //循环清空li样式
                aDiv[i].style.display='none';  //循环隐藏所有div
            }
            this.className='active';  //当前点击的元素样式变成active
            aDiv[this.index].style.display='block';    //this.index 获取当前li对应的索引
            }
        }
    }
</script>
    <script src="../js/details.js"></script>
	</body>
</html>