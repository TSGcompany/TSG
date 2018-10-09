<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/8 0008
  Time: 下午 5:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/mission.css" />
</head>
<body>
<div class="main">

    <div class="main-left">
        <div class="mis1">
            <h3>开放时间</h3>
            <!--鼠标单击登录图标直接跳出登录页面-->
            <img src="img/tb1.png">
        </div>
        <div class="mis2">
            <img src="img/tb2.png" />
            <h3>借阅服务</h3>
        </div>
        <div class="mis3">
            <img src="img/tb3.png" />
            <h3>续借/预约</h3>
        </div>
        <div class="mis4">
            <img src="img/tb4.png" />
            <h3>外借规则</h3>
        </div>
        <div class="mis5">
            <img src="img/tb5.png" />
            <h3>图书捐赠</h3>
        </div>
        <div class="mis6">
            <img src="img/tb6.png" />
            <h3>电子报刊</h3>
        </div>
        <div class="mis7">
            <img src="img/tb7.png" />
            <h3>媒体报道</h3>
        </div>
        <div class="mis8">
            <img src="img/tb8.png" />
            <h3>参观来访</h3>
        </div>
    </div>


    <!--右边大边框-->
    <div class="main-right">
        <div class="maer-right">
            <img src="img/tsg.jpg" />
            <div class="t_notice1">
                <ul id="dayTask">
                    <li>价格很高</li>
                    <li>价格很高</li>
                </ul>
            </div>
            <div class="t_notice2">
                <ul id="growTask">
                    <li>哈哈哈哈</li>
                    <li>哈哈哈哈</li>
                </ul>

                <div class="col-xs-12 information-nav-bg">
                    <div class="col-xs-1 information information-nav">重图动态</div>
                    <div class="col-xs-1 information middle-nav">业界动态</div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=basePath%>jsp/shop/js/jquery-1.12.4.js"></script>
<script src="<%=basePath%>jsp/shop/js/mission.js"></script>
</body>
</html>
