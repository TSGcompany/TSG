<!DOCTYPE html>
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    HttpSession sess = request.getSession();
    String message = (String)sess.getAttribute("mes");
    if(message == ""){
%>
<%
}else{
%>
<script type="text/javascript">
    alert("<%=message%>");
</script>
<%
        sess.setAttribute("mes", "");
    }
%>
<script src='<%=basePath%>jsp/admin/js/jquery.min.js'></script>
<script language="JavaScript">
    function del_confirm() {
        event.returnValue = confirm("删除是不可恢复的，你确认要删除吗？");
    }
</script>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="<%=basePath %>jsp/admin/css/stylee.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>jsp/admin/css/fenye.css" />
    <!-- <script type="text/javascript" src="js/jquery.js""></script>-->
    <script type="text/javascript" src="<%=basePath %>jsp/admin/js/jquery.js"></script>
    <script src='<%=basePath%>jsp/admin/js/jquery.min.js'></script>

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
            <th style="width:20%;">头像</th>
            <th style="width:15%;">用户名</th>
            <th style="width:20%;">手机号</th>
            <th style="width:20%;">邮箱</th>


            <th>操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="i" items="${AdminShow}">
            <tr>
                <td class="img_td">

                        <img src="${i.admin_head}" style="width:35px;height:35px;margin-top: 8px;margin-left: 8px; border-radius: 50px;" />

                </td>
                <td>${i.admin_nickname}</td>
                <td>${i.admin_phone}</td>
                <td>${i.admin_Email}</td>
                <td><a href="<%=basePath %>admin/updateubase?id=${i.id}" class="tablelink">修改</a>
                    <a href="<%=basePath %>admin/deleteAdmin?id=${i.id}" onclick="del_confirm()" class="tablelink"> 删除</a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
<!--分页-->
<div class="page_container center">
    <div class="page_btn prev_page left"><a class="page_btn prev_page left" href="<%=basePath%>admin/AdminShow?index=${indexPage-1}">上一页</a></div>
    <div class="page_num_container left" id="page_num_container">
        <ul>


            <c:forEach var="i" begin="1" end="${PageCount}" step="1">
                <li><a href="<%=basePath%>admin/AdminShow?index=${i-1}">${i}</a></li>
            </c:forEach>


        </ul>
    </div>
    <div class="page_btn next_page left"><a href="<%=basePath%>admin/AdminShow?index=${indexPage+1}">下一页</a></div>

    <div class="page_btn all_page right">共${PageCount}页</div>


</div>
<script src="<%=basePath %>jsp/admin/js/fenye.js"></script>
</body>
</html>
