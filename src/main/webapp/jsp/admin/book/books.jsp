<!DOCTYPE html>
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<head>
		<meta charset="UTF-8">
		<title></title>
	<link href="<%=basePath %>jsp/admin/css/stylee.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="<%=basePath %>jsp/admin/css/fenye.css" />
       <!-- <script type="text/javascript" src="js/jquery.js""></script>-->
<script type="text/javascript" src="<%=basePath %>jsp/admin/js/jquery.js"></script>


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


        <table class="tablelist">
            <thead>
            <tr>
                <th style="width:10%;">图片</th>
                <th style="width:15%;">书的类型</th>
                <th style="width:12%;">书的编号</th>
                <th style="width:15%;">书名</th>
                <th style="width:15%;">作者</th>
                <th style="width:10%;">书的数量</th>
                <th style="width:15%;">创建时间</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="i" items="${BookShow}">
                <tr>

                    <td>${i.book_icon}</td>
                    <td>${i.book_type.book_type_name}</td>
                    <td>${i.book_id}</td>
                    <td>${i.book_name}</td>
                    <td>${i.book_author}</td>
                    <td>${i.book_number}</td>
                    <td><fmt:formatDate value="${i.book_release_Date}" pattern="yyyy年MM月dd日 HH:mm"/></td>
                    <td><a href="UpdateBook.html" class="tablelink">修改</a>     <a href="" class="tablelink"> 删除</a></td>
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
    <!--分页-->
    <div class="page_container center">
        <div class="page_btn prev_page left">上一页</div>
        <div class="page_num_container left" id="page_num_container">
            <ul>
                <c:forEach  var="i" items="${PageCount}">
                    <li>1</li>
                </c:forEach>
            </ul>
        </div>
        <div class="page_btn next_page left">下一页</div>
        <div class="page_btn all_page right">共15页</div>


    </div>
    <script src="<%=basePath %>jsp/admin/js/fenye.js"></script>
</body>
</html>
