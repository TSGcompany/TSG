<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/9 0009
  Time: 下午 8:38
  To change this template use File | Settings | File Templates
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
   <!-- <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css'>-->

  <link rel='stylesheet prefetch' href="<%=basePath%>jsp/customer/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">


</head>

<body>
<ul class="accordion-menu">
    <li>
        <div class="dropdownlink"><i class="" aria-hidden="true"></i>首页</div>
    </li>

    <li>
        <div class="dropdownlink"><i class="" aria-hidden="true"><img src="images/1.png" alt="" style="margin: -10px 0 0 -10px"></i> 个人信息
            <i class="" aria-hidden="true"><img src="images/4.png" alt="" style="margin: 0px 0 0 200px"></i>
        </div>
        <ul class="submenuItems">
            <li><a href="<%=basePath%>jsp/customer/data/right.jsp" target="rightFrame">个人资料</a></li>
            <li><a href="<%=basePath%>jsp/customer/data/security.jsp" target="rightFrame">安全中心</a></li>
        </ul>
    </li>
    <li>
        <div class="dropdownlink"><i class="" aria-hidden="true"><img src="images/2.png" alt="" style="margin: -10px 0 0 -10px"></i> 我的书籍
            <i class="" aria-hidden="true"><img src="images/4.png" alt="" style="margin: 0px 0 0 200px"></i>
        </div>
        <ul class="submenuItems">
            <li><a href="<%=basePath%>jsp/customer/Book/borrwbooks.jsp" target="rightFrame">我的预约</a></li>
            <li><a href="<%=basePath%>user/myBorrowingRecord?index=0" target="rightFrame">查看所有借阅记录</a></li>
            <li><a href="<%=basePath%>user/myBorrowingIsReturnRecord?index=0" target="rightFrame">查看已还借阅记录</a></li>
            <li><a href="<%=basePath%>user/myBorrowingNotReturnRecord?index=0" target="rightFrame">查看未还借阅记录</a></li>

        </ul>
    </li>
    <li>
        <a href="<%=basePath%>jsp/customer/contact/Telephone.jsp" target="rightFrame"><div class="dropdownlink"><i class="" aria-hidden="true"><img src="images/3.png" alt="" style="margin: -10px 0 0 -10px"></i>联系管理员
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
