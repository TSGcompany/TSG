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

    <link rel="stylesheet" type="text/css" href="<%=basePath %>jsp/admin/css/fenye.css"/>
    <link href="<%=basePath %>jsp/customer/css/stylee.css" rel="stylesheet" type="text/css"/>
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
    <c:forEach var="i" items="${myBorrowingNotReturnRecord}">
            <tr>
                <td class="img_td">
                <img src="${i.borrowing_Save_bookicon}" style="width:60px;height:60px;margin-top: 8px;margin-left: 8px;" />
                </td>
                <td>${i.borrowing_Save_bookNumber}</td>
                <td>${i.borrowing_Save_bookname}</td>
                <td><fmt:formatDate value="${i.borrowing_Time}" pattern="yyyy年MM月dd日 HH:mm"/></td>
                <c:choose>
                    <c:when test="${i.borrowing_Return_Time==null}">
                        <td style="color: red">尚未归还</td>
                    </c:when>
                    <c:otherwise>
                        <td><fmt:formatDate value="${i.borrowing_Return_Time}" pattern="yyyy年MM月dd日 HH:mm"/></td>

                    </c:otherwise>
                    
                </c:choose>

              <c:choose>
                  <c:when test="${i.borrowing_Return==true}">
                      <td style="color:green"> 已归还</td>
                  </c:when>
                  <c:otherwise>
                      <td style="color: red">未归还</td>

                  </c:otherwise>
                  
              </c:choose>
            </tr>
        </c:forEach>
        </tbody>

    </table>

</div>

<div class="page_container center">
    <c:choose>
        <c:when test="${indexPage==0} ||${indexPage<0}">

            <div class="page_btn prev_page left" ><a class="page_btn prev_page left" href="<%=basePath%>user/myBorrowingNotReturnRecord?index=0">上一页</a></div>

        </c:when>

        <c:when test="${indexPage>0}">
            <div class="page_btn prev_page left" ><a class="page_btn prev_page left" href="<%=basePath%>user/myBorrowingNotReturnRecord?index=${indexPage-1}">上一页</a></div>

        </c:when>

    </c:choose>



    <div class="page_num_container left" id="page_num_container">
        <ul>
            <c:forEach var="i" begin="1" end="${PageCount}" step="1">
                <li><a href="<%=basePath%>user/myBorrowingNotReturnRecord?index=${i-1}">
                <li>${i}</li>
                </a></li>
            </c:forEach>
        </ul>
    </div>
    <c:choose>
        <c:when test="${indexPage==PageCount-1}">
            <div class="page_btn next_page left"><a href="<%=basePath%>user/myBorrowingNotReturnRecord?index=${PageCount-1}">下一页</a></div>

        </c:when>
        <c:when test="${indexPage<PageCount-1}">
            <div class="page_btn next_page left"><a href="<%=basePath%>user/myBorrowingNotReturnRecord?index=${indexPage+1}">下一页</a></div>

        </c:when>



    </c:choose>

    <div class="page_btn all_page right" >共${PageCount}页</div>

</div>
<span style="width: 80px; height:30px;border: 1px solid #ccc;margin-left:590px;margin-top:10px;float: left;"><p>当前页为${indexPage+1}</p></span>

<script src="<%=basePath %>jsp/admin/js/fenye.js"></script>
</body>
</html>