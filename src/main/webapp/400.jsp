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
    <img  style="margin-left: 600px;margin-top: 300px" src="<%=basePath%>jsp/shop/img/400.jpg" />

</div>
</body>
</html>