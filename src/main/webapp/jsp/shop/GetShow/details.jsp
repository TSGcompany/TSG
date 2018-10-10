<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>图书馆详情页</title>
		<link rel="stylesheet" type="text/css" href="../css/mission.css" />
		<link rel="stylesheet" type="text/css" href="../css/details.css" />
		<link rel="stylesheet" type="text/css" href="../css/bookstore.css" />
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
			<p>书名：愿你的青春不负梦想</p></br>
			    <p>作者：俞敏洪</p></br>
			    <p>可借册数：15</p></br>
			    <p>评分：（已有0条评论）</p>
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
			<div class="item">
				<div class="pic">
					<img src="../img/ts1.jpg"  alt="">
				</div>
				<div class="desc">
					<div class="detail"><i>愿你的青春不负梦想</i>
					</div>
				</div>
			</div>
      	 </div>    
      
      	
      	
       </div>
       
       <!--<div class="right_evaluate">-->
       	<div class="tab">
        <div id="box">
            <!--这个ul为选项卡的菜单，提供选择项，并且设置其中一个li为默认样式-->
            <ul>
                <li class="active">目录</li>
                <li>评论</li>
            </ul>
            <!--这个div为选项卡的内容，显示不同菜单的不同内容，并且设置其中一个div为可见，其他隐藏-->
            <div id="content">
                <div style="display: block;">目录</div>
                <div>评论</div>
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
