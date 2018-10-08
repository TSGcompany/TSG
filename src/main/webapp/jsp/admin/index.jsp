<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/3 0003
  Time: 下午 6:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
    <frame src="top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
    <frameset cols="250,*" frameborder="no" border="0" framespacing="0">
        <frame src="left.jsp" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame"  />
        <frame src="admin/update.jsp" name="rightFrame" id="rightFrame" title="rightFrame" />
    </frameset>
</frameset>
<noframes>
<body>

</body>
</html>
