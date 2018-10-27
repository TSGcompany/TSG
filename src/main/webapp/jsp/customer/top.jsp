<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/8 0008
  Time: 下午 5:13
  To change this template use File | Settings | File. Templates
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>头部</title>
    <link rel="stylesheet" href="<%=basePath%>jsp/shop/css/jquery.hiSlider.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/customer/css/top.css">
</head>
<body>
<div class="key_top">
    <ul class="heg">
        <li class="nav_img2"><img src="<%=basePath%>jsp/customer/images/lcvclogo.png"></li>
        <li><a href="<%=basePath%>shop/ToShopIndex" target="_top">首页</a></li>
        <li><a href="">读者服务</a></li>
        <li><a href="">资源动态</a></li>
        <li><a href="">讲座/活动</a></li>
        <c:choose>
            <c:when test="${sessionScope.customer.customer_head!=null}">
                <li class="img_head"><img src="${sessionScope.customer.customer_head}"/></li>

            </c:when>
            <c:otherwise>
                <li class="img_head"><img src="<%=basePath%>jsp/OtherFile/image/defaultHeadimage.gif"/></li>
            </c:otherwise>

        </c:choose>

        <li class="nav_2"><a href="<%=basePath%>user/logout" target="_parent">退出</a></li>

        <iframe allowtransparency="true" frameborder="0" width="180" height="36"
                style="margin:-8px 105px 0 0; float: right;" scrolling="no"
                src="//tianqi.2345.com/plugin/widget/index.htm?s=3&z=2&t=0&v=0&d=3&bd=0&k=000000&f=ffffff&ltf=ffff00&htf=ff8000&q=1&e=1&a=1&c=54511&w=180&h=36&align=center"></iframe>
    </ul>.
</div>
</body>
</html>