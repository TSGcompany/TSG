<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/8 0008
  Time: 下午 5:12
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
    <title>图书馆借阅系统</title>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/middle.css"/>
    <script src="<%=basePath%>jsp/shop/js/jquery.1.9.1.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>jsp/admin/css/fenye.css"/>

    <script>
        $(document).ready(function () {
            //=====================没登录时点击借阅按钮======================
            $("div[name='NoLoginButton']").click(function () {

                alert("请先登录！");
            });

            //====================登录之后点击借阅按钮 .========================
            $("div[name='BorrowingBookBtn']").click(function () {

                var AddBorrowing = $(this).find("span").attr("name");//获取span中的name值

                $.get(AddBorrowing, function (data) {//路径， 返回值
                    if (data.BorrowingMessage == 1) {
                        alert("借阅成功！")
                        //跳转页面0

                    }
                    if (data.BorrowingMessage == 0) {
                        alert("您已经被禁止借书！")
                    }
                    if (data.BorrowingMessage == 2) {
                        alert("每本书只能被借一次！")
                    }
                    if (data.BorrowingMessage == 3) {
                        alert("该书已经借完请联系管理员！")
                    }
                });

            });
            //===============================点击页码========================
            var indexPage = ${indexPage};
            var PageCount =${PageCount};
            $("#last_page").click(function () {//点击上一页

                if (indexPage == 0 || indexPage < 0) {
                    location.href = "<%=basePath%>shop/getShopIndexBook?index=0";
                } else {
                    location.href = "<%=basePath%>shop/getShopIndexBook?index=${indexPage-1}";

                }
            });
            $("#next_page").click(function () {//点击下一页
                //判断当前页是否是最后一页 如果是就让他等于最大页数
                if (indexPage == PageCount - 1) {
                    location.href = "<%=basePath%>shop/getShopIndexBook?index=${PageCount-1}";
                } else {
                    location.href = "<%=basePath%>shop/getShopIndexBook?index=${indexPage+1}";
                }


            });
        });

    </script>
</head>
<body>
<!--
作者：offline
时间：2018-09-19
描述：整个
-->

<div class="middle">
    <!--
作者：offline
时间：2018-09-19
描述：上面
-->

    <!--图书展示大框-->
    <div class="tsg_classify">
        <!--书本灰色边框 -->
        <c:forEach items="${getShopIndexBook}" var="i">
            <div id="tsg_among">
                <a href="<%=basePath%>shop/toBookDetailsPage?book_id=${i.id}" target="_top">
                    <img id="getBookDetails" src="${i.book_icon}"/>
                    <span id="bookid" name="${i.id}" hidden></span>
                    <h4 style="margin-top: -5px">${i.book_author}</h4>
                    <p style="margin-top: 20px">《${i.book_name}》</p>

                    <!--五星评分-->
                    <ul class="comment">
                        <li>★</li>
                        <li>★</li>
                        <li>★</li>
                        <li>★</li>
                        <li>★</li>
                    </ul>

                </a>
                <c:choose>
                    <c:when test="${sessionScope.customer!=null}">

                        <div id="button" name="BorrowingBookBtn">
                            <span hidden name="<%=basePath%>user/BorrowingBook?book_id=${i.id}"></span>
                            <a>借阅</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div id="button" name="NoLoginButton">
                            <a href="<%=basePath%>jsp/shop/login/login.jsp" target="_top">借阅</a>
                        </div>
                    </c:otherwise>
                </c:choose>

                <div id="make">
                    <a href="#"> 预约</a>
                </div>

            </div>
        </c:forEach>
    </div>
</div>

<!--
作者：offline
时间：2018-09-20
描述：分页
-->
<!--分页-->
<div class="page_container center">
    <div class="page_btn prev_page left" id="last_page"><p>上一页</p></div>

    <div class="page_num_container left" id="page_num_container">
        <ul>
            <c:forEach var="i" begin="1" end="${PageCount}" step="1">

                <li><a href="<%=basePath%>/shop/getShopIndexBook?index=${i-1}"><p
                        style="margin-top: -8px;color:#90a2bc"> ${i}</p></a></li>

            </c:forEach>
        </ul>
    </div>

    <div class="page_btn next_page left" id="next_page"><p>下一页</p></div>
    <div class="page_btn all_page right">共${PageCount}页</div>
</div>
<span style="width: 80px; height:30px;border: 1px solid #ccc;margin-left:580px;margin-top:9px;float: left;"><p>当前页为${indexPage+1}</p></span>
<script src="<%=basePath%>jsp/shop/js/jquery-1.11.0.js"></script>
<script src="<%=basePath%>jsp/shop/js/index.js"></script>
</body>
</html>
