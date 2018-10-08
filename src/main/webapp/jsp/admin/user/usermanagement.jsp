
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>添加书籍</title>
    <link href="<%=basePath%>jsp/admin/css/stylee.css" rel="stylesheet" type="text/css"/>
</head>

<body>


<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">用户管理</a></li>
    </ul>
</div>

<div class="rightinfo">

    <div class="tools">
        <ul class="toolbar">
            <li class="click">
                <a href="Addmanag.html">
                    <span><img src="<%=basePath%>jsp/admin/images/t01.png"/></span>添加管理员
                </a>
            </li>
        </ul>


    </div>


    <table class="tablelist">
        <thead>

        <tr>
            <th style="width:3%;"><input name="" type="checkbox" value="" checked="checked"/></th>
            <th style="width:20%;">头像 </th>
            <th style="width:15%;">用户名</th>
            <th style="width:10%;">性别</th>
            <th style="width:20%;">手机号</th>
            <th style="width:25%;">邮箱</th>


            <th>操作</th>
        </tr>
        </thead>

        <tbody>
            <c:forEach var="i" items="${customerShow}">
            <tr>
                <td><input name="" type="checkbox" value=""/></td>
                <td style="height: 80px">${i.customer_name}</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td><a href="" class="tablelink">禁止借书</a> <a href="" class="tablelink"> 详情</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>

        <div class="tipinfo">
            <span><img src="images/ticon.png"/></span>
            <div class="tipright">
                <p>是否确认对信息的修改 ？</p>
                <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
        </div>

        <div class="tipbtn">
            <input name="" type="button" class="sure" value="确定"/>&nbsp;
            <input name="" type="button" class="cancel" value="取消"/>
        </div>

    </div>


</div>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
</body>
</html>
