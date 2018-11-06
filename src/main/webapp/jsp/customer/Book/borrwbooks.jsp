<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/9 0009
  Time: 下午 8:24
  To change this template use File | Settings | File Templates.
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
    <title>我的预约</title>
    <link href="<%=basePath%>jsp/customer/css/record.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="formbody">

    <div class="formtitle"><span>我的预约</span></div>

    <table class="tablelist">
        <thead>
        <tr>
            <th style="width:10%;">图书图片</th>
            <th style="width:10%;">图书编号</th>
            <th style="width:15%;">书名</th>
            <th style="width:25%;">是否可借</th>
            <th style="width:15%;">操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="i" items="${selectCollectionWhereUser}">
            <tr>
                </td>
                <td> <img style="width: 60px; height: 80px" src="${i.collection_bookIcon}"></td>
                <td>${i.collection_bookNumber}</td>
                <td>${i.collection_bookName}</td>
                <c:choose>
                    <c:when test="${i.iscollection==false}">

                        <td>是</td>
                    </c:when>
                    <c:otherwise>
                        否

                    </c:otherwise>

                </c:choose>

                <td><a href="#" class="tablelink">借阅</a> <a href="" class="tablelink">&nbsp;&nbsp;&nbsp;&nbsp;删除</a></td>
            </tr>
        </c:forEach>
        </tbody>

    </table>

</div>
</body>

</html>