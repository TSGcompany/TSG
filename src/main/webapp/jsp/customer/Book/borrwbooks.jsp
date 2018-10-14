<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/9 0009
  Time: 下午 8:24
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
    <title>图书借阅</title>
    <link href="../css/record.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="formbody">

    <div class="formtitle"><span>图书借阅</span></div>

    <table class="tablelist">
        <thead>
        <tr>
            <th style="width:10%;">借书证号</th>
            <th style="width:15%;">借书日期</th>
            <th style="width:25%;">图书名称</th>
            <th style="width:10%;">书价</th>
            <th style="width:15%;">还书时间</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="producttype" items="${requestScope.list}">
            <tr>

                </td>
                <td>10205</td>
                <td><fmt:formatDate value="" pattern="yyyy年MM月dd日 HH:mm"/></td>
                <td>3</td>
                <td><fmt:formatDate value="" pattern="yyyy年MM月dd日 HH:mm"/></td>
                <td><fmt:formatDate value="" pattern="yyyy年MM月dd日 HH:mm"/></td>
            </tr>
        </c:forEach>
        </tbody>

    </table>

</div>
</body>

</html>