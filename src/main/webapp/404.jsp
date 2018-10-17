<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%response.setStatus(HttpServletResponse.SC_OK);%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${ctx}/resources/css/style.css" type="text/css" />
    <title>404</title>
</head>
<body style="background:none;">
<div class="ds_center">
    <img src="<%=basePath%>jsp/shop/img/404.jpg" />

    <a href="${ctx}/userInfo/front_login.htm">返回登录页</a> <a href="javascript:history.go(-1);" style="margin-left:50px;">返回上一层</a>
</div>
</body>
</html>