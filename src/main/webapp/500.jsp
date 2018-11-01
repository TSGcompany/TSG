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
    <link rel="stylesheet" href="${ctx}<%=basePath%>jsp/shop/css/my_error_404.css" type="text/css" />
    <title>404</title>
</head>
<body style="background:none;">
<div class="ds_center">
    <img src="<%=basePath%>jsp/shop/img/500.png" />
    <div class="error_404_1" style="margin-top: -150px;margin-left: 400px"><a href="javascript:history.go(-1);" >返回上一层</a></div>
    <div class="error_404_2" style="margin-top: -150px"><a href="<%=basePath%>shop/ToShopIndex" target="_top">返回登录页</a></div>
</div>
</body>
</html>