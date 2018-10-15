<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/10/15
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>热门部分</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/middle.css" />
</head>
<body>
<div class="ts_cones">
    <div class="topit1">
        <h3>热门推荐</h3>
        <img src="img/rd1.png"/>
    </div>
    <div class="topit2">
        <h3>图书推荐</h3>
        <img src="img/rd2.png"/>
    </div>
    <div class="topit3">
        <h3>阅读荐书</h3>
        <img src="img/rd3.png"/>
    </div>
    <div class="tsg_input">
        <select id="u_input">
            <option selected value="请选择图书分类">请选择图书分类</option>
            <option value="青春文学">青春文学</option>
            <option value="小说">小说</option>
            <option value="励志与成功">励志与成功</option>
            <option value="心理学">心理学</option>
            <option value="科学与自然">科学与自然</option>
            <option value="历史">历史</option>
            <option value="社会科学">社会科学</option>
        </select>

        <div id="tsg_mane">
            <input type="text" name="search" placeholder="请输入关键字">
            <div id="search">搜索</div>
        </div>
    </div>
</div>

</body>
</html>
