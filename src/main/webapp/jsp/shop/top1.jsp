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
            <li class="img_head"><img src="img/tx.jpeg"/></li>
            <li class="nav_2"><a href="#" target="_parent">退出</a></li>
            <iframe allowtransparency="true" frameborder="0" width="180" height="36" style="margin:-8px 20px 0 0; float: right;" scrolling="no" src="//tianqi.2345.com/plugin/widget/index.htm?s=3&z=2&t=0&v=0&d=3&bd=0&k=000000&f=ffffff&ltf=ffff00&htf=ff8000&q=1&e=1&a=1&c=54511&w=180&h=36&align=center"></iframe>
        </ul>
    </div>
</div>
</body>
</html>
