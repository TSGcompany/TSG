<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/3 0003
  Time: 下午 6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <title>Title</title>
</head>
<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="<%=basePath%>jsp/admin/top.html" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
    <frameset cols="250,*" frameborder="no" border="0" framespacing="0">
        <frame src="<%=basePath%>jsp/admin/left.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame"  />
        <frame src="<%=basePath%>jsp/admin/admin/update.jsp" name="rightFrame" id="rightFrame" title="rightFrame" />
    </frameset>
</frameset>
<noframes>
<body>

</body>
</html>
