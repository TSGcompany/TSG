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

    <script>

        $(document).ready(function () {
            //=====================没登录时点击借阅按钮======================
            $("div[name='NoLoginButton']").click(function () {

                alert("请先登录！");
            });

            //====================登录之后点击借阅按钮========================
            $("div[name='BorrowingBookBtn']").click(function () {

              alert($("#BorrowingBookURL").val());

                $.get($("#BorrowingBookURL").val(),function (data) {
                   if(data.BorrowingMessage==1){
                        alert("借阅成功！")
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
                <c:when test="${sessionScope.Customer!=null}">

                    <div id="button" name="BorrowingBookBtn">
                        <a >借阅${i.id}</a>

                        <input hidden id="BorrowingBookURL" value="<%=basePath%>shop/BorrowingBook?book_id=${i.id} ">
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
        <div class="page_container center">
            <div class="page_btn prev_page left">上一页</div>
            <div class="page_num_container left" id="page_num_container">
                <ul>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>6</li>
                    <li>7</li>
                    <li>8</li>
                    <li>9</li>
                    <li>10</li>
                    <li>11</li>
                    <li>12</li>
                    <li>13</li>
                    <li>14</li>
                    <li>15</li>
                    <li>16</li>
                    <li>17</li>
                    <li>18</li>
                    <li>19</li>
                    <li>20</li>
                    <li>21</li>
                </ul>
            </div>
            <div class="page_btn next_page left">下一页</div>
            <div class="page_btn all_page right">共21页</div>


        </div>

<script src="<%=basePath%>jsp/shop/js/jquery-1.11.0.js"></script>
<script src="<%=basePath%>jsp/shop/js/index.js"></script>
</body>
</html>
