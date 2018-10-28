<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/8 0008
  Time: 下午 5:13
  To change this template use File | Settings | File Templates.
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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/top1.css">
    <script src="<%=basePath%>jsp/shop/js/jquery-1.12.4.js"></script>
    <script src="<%=basePath%>jsp/shop/js/top.js"></script>
    <script>
        $(document).ready(function () {
            //当用户登录后点击头像
            $("#customer_head_click").click(function () {
                location.href = "<%=basePath%>user/ToIndex";
            });
        });


    </script>

</head>
<body>
<div class="key_top">
    <ul class="heg">
        <li class="nav_img2"><img src="<%=basePath%>jsp/shop/img/lcvclogo.png"></li>
        <li class="nav_1"><a href="<%=basePath%>shop/ToShopIndex" target="_top">首页</a></li>
        <li><a href="">网上借阅</a></li>
        <li><a href="">读者服务</a></li>
        <li><a href="">资源动态</a></li>
        <li><a href="">讲座/活动</a></li>
        <c:choose>
            <c:when test="${sessionScope.customer!=null}">
                <c:choose>
                <c:when test="${sessionScope.customer.customer_head!=null}">
                    <li class="img_head" id="customer_head_click"><img src="${sessionScope.customer.customer_head}"/></li>
                    <li class="nav_2"><a href="<%=basePath%>user/logout" target="_parent" target="_parent">退出</a></li>
                </c:when>
                <c:otherwise>

                    <li class="img_head"><img src="<%=basePath%>jsp/OtherFile/image/defaultHeadimage.gif"/></li>
                    <li class="nav_2"><a href="<%=basePath%>user/logout" target="_parent" target="_parent">退出</a></li>
                </c:otherwise>
                </c:choose>

            </c:when>
            <c:otherwise>
                <li class="img_head"><img src="img/tx.jpeg"/></li>
                <li class="nav_2"><a href="<%=basePath%>jsp/shop/login/login.jsp" target="_top">您尚未登录！</a></li>
            </c:otherwise>

        </c:choose>


        <iframe allowtransparency="true" frameborder="0" width="180" height="36" style="margin:-8px 70px 0 0; float: right;" scrolling="no" src="//tianqi.2345.com/plugin/widget/index.htm?s=3&z=2&t=0&v=0&d=3&bd=0&k=000000&f=ffffff&ltf=ffff00&htf=ff8000&q=1&e=1&a=1&c=54511&w=180&h=36&align=center"></iframe>
    </ul>

</div>
</body>
</html>
