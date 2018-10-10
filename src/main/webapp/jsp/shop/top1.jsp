<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/8 0008
  Time: 下午 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>头部</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/top1.css">
    <script src="<%=basePath%>jsp/shop/js/jquery-1.12.4.js"></script>
    <script src="<%=basePath%>jsp/shop/js/top.js"></script>
</head>
<body>
<div class="nav">

    <div class="navbar">
        <ul>
            <li><a href="top.html">首页</a></li>
            <li><a href="#">网上借阅</a></li>
            <li><a href="#">读者服务</a></li>
            <li><a href="#">资源动态</a></li>
            <li><a href="#">讲座/活动</a></li>
            <li class="nav_img"><a href="<%=basePath%>jsp/shop/login/login.jsp" target="rightFrame"><img src="<%=basePath%>jsp/shop/img/登录.png"></a></li>
        </ul>
    </div>
</div>
</body>
</html>
