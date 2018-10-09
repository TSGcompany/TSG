<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/8 0008
  Time: 下午 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>图书借阅系统</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/index.css">
</head>
<body>
<iframe src="top.jsp" width="100%" height="400px" frameborder="0" name="top" scrolling="no">
</iframe>
<iframe src="mission.jsp" width="100%" height="580px" frameborder="0" name="mission" scrolling="no">
</iframe>
<iframe src="middle.jsp" width="100%" height="1109px" frameborder="0" name="middle" scrolling="no">
</iframe>
<iframe src="foot.jsp" width="100%" height="100px" frameborder="0" name="foot" scrolling="no">
</iframe>
</body>
</html>
