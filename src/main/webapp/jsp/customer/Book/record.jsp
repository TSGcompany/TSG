<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/9 0009
  Time: 下午 8:24
  To change this template use File | Settings | File Templates.
     <td><fmt:formatDate value="" pattern="yyyy年MM月dd日 HH:mm"/></td>
                <td><fmt:formatDate value="" pattern="yyyy年MM月dd日 HH:mm"/></td>
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>

<head>
    <meta charset="UTF-8">
    <title>查看历史记录</title>
    <link href="<%=basePath%>jsp/customer/css/record.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="formbody">
    <div class="formtitle"><span>查看历史记录</span></div>

    <table class="tablelist">
        <thead>
        <tr>
            <th style="width:10%;">图片</th>
            <th style="width:15%;">书籍编号</th>
            <th style="width:15%;">书名</th>
            <th style="width:20%;">借出时间</th>
            <th style="width:20%;">归还时间</th>
            <th style="width:15%;">是否归还</th>
        </tr>
        </thead>

        <tbody>
    <c:forEach var="i" items="getBook_TypeAll">
            <tr>
                <td class="img_td">
                <img src="" style="width:60px;height:60px;margin-top: 8px;margin-left: 8px;" />
                </td>
                <td>0</td>
                <td>2</td>
                <td>2</td>

                <td>6</td>
                <td>6</td>
            </tr>
        </c:forEach>
        </tbody>

    </table>

</div>
</body>

</html>