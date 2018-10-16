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
    <title>查看历史记录</title>
    <link href="../css/record.css" rel="stylesheet" type="text/css" />
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
            <th style="width:15%;">图书评论</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="producttype" items="${requestScope.list}">
            <tr>
                <td class="img_td">
                    <c:choose>
                        <img src="../images/tx.jpeg" style="width:60px;height:60px;margin-top: 8px;margin-left: 8px;" />
                    </c:choose>
                </td>
                <td>1</td>
                <td>2</td>
                <td><fmt:formatDate value="" pattern="yyyy年MM月dd日 HH:mm"/></td>
                <td><fmt:formatDate value="" pattern="yyyy年MM月dd日 HH:mm"/></td>
                <td>6</td>
            </tr>
        </c:forEach>
        </tbody>

    </table>

</div>
</body>

</html>