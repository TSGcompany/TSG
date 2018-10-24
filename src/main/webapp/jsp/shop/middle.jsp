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

    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/middle.css" />
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
              var AddBorrowing= $(this).find("span").attr("name");//获取span中的name值

                $.get(AddBorrowing,function (data) {//路径， 返回值
                   if(data.BorrowingMessage==1){
                        alert("借阅成功！")
                       //跳转页面0

                   }
                    if(data.BorrowingMessage==0){
                        alert("您已经被禁止借书！")
                    }
                    if(data.BorrowingMessage==2){
                        alert("每本书只能被借一次！")
                    }

                });

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
            <img src="<%=basePath%>jsp/shop/img/ts1.jpg" />
            <h4>${i.book_author}</h4>
            <p>《${i.book_name}》</p>

            <!--五星评分-->
            <ul class="comment">
                <li>★</li>
                <li>★</li>
                <li>★</li>
                <li>★</li>
                <li>★</li>
            </ul>


            <c:choose>
                <c:when test="${sessionScope.customer!=null}">

                    <div id="button" name="BorrowingBookBtn">
                        <span hidden name="<%=basePath%>shop/BorrowingBook?book_id=${i.id}"></span>
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
    <c:choose>
        <c:when test="${indexPage==0} ||${indexPage<0}">

            <div class="page_btn prev_page left" ><a class="page_btn prev_page left" href="<%=basePath%>shop/getShopIndexBook?index=0">上一页</a></div>

        </c:when>

        <c:when test="${indexPage>0}">
            <div class="page_btn prev_page left" ><a class="page_btn prev_page left" href="<%=basePath%>shop/getShopIndexBook?index=${indexPage-1}">上一页</a></div>

        </c:when>

    </c:choose>



    <div class="page_num_container left" id="page_num_container">
        <ul>
            <c:forEach var="i" begin="1" end="${PageCount}" step="1">
                <li><a href="<%=basePath%>shop/getShopIndexBook?index=${i-1}">
                <li>${i}</li>
                </a></li>
            </c:forEach>
        </ul>
    </div>
    <c:choose>
        <c:when test="${indexPage==PageCount-1}">
            <div class="page_btn next_page left"><a href="<%=basePath%>shop/getShopIndexBook?index=${PageCount-1}">下一页</a></div>

        </c:when>
        <c:when test="${indexPage<PageCount-1}">
            <div class="page_btn next_page left"><a href="<%=basePath%>shop/getShopIndexBook?index=${indexPage+1}">下一页</a></div>

        </c:when>



    </c:choose>

    <div class="page_btn all_page right" >共${PageCount}页</div>

</div>
<span>当前页为${indexPage+1}</span>
<script src="<%=basePath %>jsp/admin/js/fenye.js"></script>
<script src="<%=basePath%>jsp/shop/js/jquery-1.11.0.js"></script>
<script src="<%=basePath%>jsp/shop/js/index.js"></script>
</body>
</html>
