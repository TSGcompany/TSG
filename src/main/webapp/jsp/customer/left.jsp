<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/9 0009
  Time: 下午 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>右边</title>

    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css'>
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Montserrat'>
    <link rel="stylesheet" href="css/style.css">


</head>

<body>
<ul class="accordion-menu">
    <li>
        <div class="dropdownlink"><i class="fa fa-road" aria-hidden="true"></i>首页</div>
    </li>

    <li>
        <div class="dropdownlink"><i class="fa fa-paper-plane" aria-hidden="true"></i> 个人信息
            <i class="fa fa-chevron-down" aria-hidden="true"></i>
        </div>
        <ul class="submenuItems">
            <li><a href="<%=basePath%>jsp/customer/data/right.jsp" target="rightFrame">个人资料</a></li>
            <li><a href="<%=basePath%>jsp/customer/data/security.jsp" target="rightFrame">安全中心</a></li>
        </ul>
    </li>
    <li>
        <div class="dropdownlink"><i class="fa fa-quote-left" aria-hidden="true"></i> 我的书籍
            <i class="fa fa-chevron-down" aria-hidden="true"></i>
        </div>
        <ul class="submenuItems">
            <li><a href="#" target="rightFrame">我借的书</a></li>
            <li><a href="<%=basePath%>jsp/customer/Book/record.jsp" target="rightFrame">查看历史记录</a></li>
        </ul>
    </li>
    <li>
        <a href="contact/Telephone.html" target="rightFrame"><div class="dropdownlink"><i class="fa fa-motorcycle" aria-hidden="true"></i>联系管理员
        </div></a>

    </li>
</ul>

<div style="text-align:center;clear:both">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>

<script src='js/jquery-2.2.4.min.js'></script>

<script  src="js/index.js"></script>

</body>
</html>
