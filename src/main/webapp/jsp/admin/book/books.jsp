<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<head>
		<meta charset="UTF-8">
		<title></title>
	<link href="../css/stylee.css" rel="stylesheet" type="text/css" />

       <!-- <script type="text/javascript" src="js/jquery.js""></script>-->
<script type="text/javascript" src="js/jquery.js"></script>


</head>


<body>


	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">所有书籍</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    	<ul class="toolbar">
        <li class="click">
           <a href="Addbooks.jsp">
          <span><img src="../images/t01.png"/></span>添加书籍
          </a>
          </li>
        </ul>
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:3%;"><input name="" type="checkbox" value="" checked="checked"/></th>
        <th style="width:10%;">书的类型</th>
        <th style="width:10%;">书的编号</th>
        <th style="width:15%;">书名</th>
        <th style="width:15%;">作者</th>
        <th style="width:15%;">图片</th>
        <th style="width:10%;">书的数量</th>
        <th style="width:15%;">创建时间</th>
        <th>操作</th>
        </tr>
        </thead>
        
        <tbody>
         <c:forEach var="producttype" items="${requestScope.list}">
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>2</td>
        <td>3</td>
         <td>4</td>
        <td>5</td>
         <td>6</td>
         <td><fmt:formatDate value="" pattern="yyyy年MM月dd日 HH:mm"/></td>
        <td><a href="UpdateBook.jsp" class="tablelink">修改</a>     <a href="" class="tablelink"> 删除</a></td>
        </tr> 
        </c:forEach> 
        </tbody>
    </table>
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
