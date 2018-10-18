<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/10/15
  Time: 11:13
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
    <title>热门部分</title>
    <script src="<%=basePath%>jsp/shop/js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/middle.css" />
    <script>


        $(document).ready(function () {
            setInterval("startRequest()", 3000);//0.5s一次
        });
        function startRequest() {
           $.get("<%=basePath%>shop/RefreshInputValue",function (data) {

               $("#searchInput").attr("placeholder",data.RefreshInputValue);

           });
          //  $("#searchInput").attr("placeholder","ccccd");
        }


    </script>
</head>
<body>
<div class="ts_cones">
    <div class="topit1">
        <h3>热门推荐</h3>
        <img src="<%=basePath%>jsp/shop/img/rd1.png"/>
    </div>
    <div class="topit2">
        <h3>图书推荐</h3>
        <img src="<%=basePath%>jsp/shop/img/rd2.png"/>
    </div>
    <div class="topit3">
        <h3>阅读荐书</h3>
        <img src="<%=basePath%>jsp/shop/img/rd3.png"/>
    </div>
    <div class="tsg_input">


        <select name="book_type.id" id="u_input">
            <option value="">请选择</option>
            <c:forEach var="i" items="${getBookType}">
                <option value="${i.id}">${i.book_type_name}</option>
            </c:forEach>
        </select>

        <div id="tsg_mane">
            <input type="text" name="search" id="searchInput" value="" placeholder="${getBookRandomName}">
            <div id="search">搜索</div>
        </div>
    </div>
</div>

</body>
</html>
