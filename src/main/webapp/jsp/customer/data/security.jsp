<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/9 0009
  Time: 下午 8:56
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
    <title>安全中心</title>
    <link href="../css/stylee.css" rel="stylesheet" type="text/css" />

</head>

<body>

<div class="formbody">

    <div class="formtitle"><span>安全中心</span></div>
    <form action="<%=basePath%>/admin/admin/updatePass" method="post">
        <ul class="forminfo">
            <li><label>*旧密码</label><input name="lodpass" type="text" class="dfinput" /></li>
            <li><label>*新密码</label><input name="newpass" type="text" class="dfinput" /></li>
            <li><label>*确认密码</label><input name="okpass" type="text" class="dfinput" /></li>
            <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认修改"/></li>
        </ul>
    </form>

</div>
</body>
</html>
