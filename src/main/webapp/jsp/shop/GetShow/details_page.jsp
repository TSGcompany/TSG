<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<%@ page contentType="text/html;charset=UTF-8" language="java" %>
		<%
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
		%>
	</head>
	<body>
	<iframe src="<%=basePath%>jsp/shop/top1.jsp" width="100%" height="70px" frameborder="0" name="top" scrolling="no">
      </iframe>
      <iframe src="<%=basePath%>shop/getBookDetails" width="100%" height="1350px" frameborder="0" name="details" scrolling="no">
</iframe>
	<iframe src="<%=basePath%>jsp/shop/foot.jsp" width="100%" height="100px" frameborder="0" name="foot" scrolling="no">
</iframe>
	</body>
</html>
