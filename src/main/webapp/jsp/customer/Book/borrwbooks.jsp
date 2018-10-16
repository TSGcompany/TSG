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
    <title>我的预约</title>
    <link href="../css/record.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="formbody">

    <div class="formtitle"><span>我的预约</span></div>

    <table class="tablelist">
        <thead>
        <tr>
            <th style="width:10%;">预约图书</th>
            <th style="width:15%;">预约编号</th>
            <th style="width:25%;">预约日期</th>
            <th style="width:15%;">预约操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="producttype" items="${requestScope.list}">
            <tr>

                </td>
                <td>1</td>
                <td>2</td>
                <td><fmt:formatDate value="" pattern="yyyy年MM月dd日 HH:mm"/></td>
                <td><a href="#" class="tablelink">预约</a> <a href="" class="tablelink"> 取消</a></td>
            </tr>
        </c:forEach>
        </tbody>

    </table>

</div>
</body>

</html>