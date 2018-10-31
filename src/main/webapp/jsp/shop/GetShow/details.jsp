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
    <title>图书馆详情页</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/mission.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/details.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/bookstore.css"/>
    <script src="<%=basePath%>jsp/shop/js/details.js"></script>
    <script src="<%=basePath%>jsp/shop/js/jquery-1.12.4.js"></script>
    <script>
        $(document).ready(function () {
    //当用户没登录时点击借阅按钮
            $("div[name='customerNotLogin']").click(function () {
                location.target="<%=basePath%>jsp/shop/login/login.jsp";
                alert("您尚未登录！")
            });

     //当用户登录之后点击借阅按钮
            $("div[name='customerLogin']").click(function () {
                var book_id=$(this).find("p").text();//获取id
             //   alert(book_id);

                $.get("<%=basePath%>user/BorrowingBook?book_id="+book_id, function (data) {//路径， 返回值
                 //   alert(data.BorrowingMessage);
                    if (data.BorrowingMessage == 1) {
                        alert("借阅成功！")

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
        });


    </script>
</head>
<body>


<div class="tsg_details">
    <!--
        作者：offline
        时间：2018-09-25
        描述：右边图片
   -->
    <div class="tsg_picture">
        <img class="circle" src="${getBookDetails.book_icon}" width="300px" height="350px"/>
    </div>
    <!--
        作者：offline
        时间：2018-09-25
        描述：左边简介
   -->
    <div class="synopsis">
        <p>书名：${getBookDetails.book_name}</p></br>
        <p>作者：${getBookDetails.book_author}</p></br>
        <p>可借册数：${getBookDetails.book_number}</p></br>
        <p>评分：（已有0条评论）</p></br>
        <p>简介：</p>
        <div class="brief"
             style="width: 700px; height: 165px;font-size:16px;border: 1px solid #ccc;margin-top: 5px;text-indent:35px">${getBookDetails.book_description}</div>
    </div>
    <!--
        作者：offline
        时间：2018-09-25
        描述：借阅按钮
    -->
<c:choose>
    <c:when test="${sessionScope.customer!=null}">
        <div id="borrow" name="customerLogin" style="margin-top: 400px">
            <a href="">借阅</a>
            <p hidden>${getBookDetails.id}</p>
        </div>

    </c:when>
    <c:otherwise>

        <div id="borrow" name="customerNotLogin" style="margin-top: 400px">
            <a href="">借阅</a>
        </div>
    </c:otherwise>

</c:choose>



    <!--
        作者：offline
        时间：2018-09-25
        描述：预约按钮
    -->
    <div id="make" style="margin-top: 400px">
        <a href="#">预约</a>

    </div>
</div>
</div>
<!--最外边框-->
<div class="rectan">
    <!--图书排行榜小框-->
    <div class="kanle">
        <h3>图书排行榜</h3>
    </div>
    <!--最左边长条框-->
    <div class="list">
        <!--第一部分-->
        <c:forEach items="${recommend_Book}" var="i">
            <a href="<%=basePath%>shop/toBookDetailsPage?book_id=${i.id}" target="_top">
            <div class="book1">
                <div class="item">
                    <div class="pic">
                        <img src="${i.book_icon}">
                    </div>
                    <div class="desc">
                        <div class="detail"><i>${i.book_name}</i>
                        </div>
                    </div>
                </div>
            </div>
            </a>
        </c:forEach>

    </div>

    <!--<div class="right_evaluate">-->
    <div class="tab">
        <div id="box">
            <!--这个ul为选项卡的菜单，提供选择项，并且设置其中一个li为默认样式-->
            <ul>
                <li class="active">目录</li>
                <li>评论</li>
            </ul>
            <!--这个div为选项卡的内容，显示不同菜单的不同内容，并且设置其中一个div为可见，其他隐藏-->
            <div id="content">
                <div style="display: block;">
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        目录</h2>

                    <!--<img src="<%=basePath%>jsp/shop/img/emptyImage.png" style="width: 870px;height:800px;position: absolute;margin-top: -90px;">-->
                </div>

                <div>
                    <img src="<%=basePath%>jsp/customer/images/ptx.jpg"
                         style="width: 50px;height:50px;border-radius:50px;margin: 10px 10px;">
                    <h2 style="font-size: 16px;margin: -35px 70px; border-bottom: 1px dashed #CCCCCC;height: 50px">
                        评论</h2></br></br>


                </div>


            </div>
        </div>
    </div>

    <script type="text/javascript">
        window.onload = function () {
            var oBox = document.getElementById('box');
            var aLi = oBox.getElementsByTagName('li');
            var oCon = document.getElementById('content');
            var aDiv = oCon.getElementsByTagName('div');

            for (var i = 0; i < aLi.length; i++) {
                aLi[i].index = i;   //为每个li添加对应的索引index
                aLi[i].onclick = function () {   //循环为每个li添加onclick事件
                    for (var i = 0; i < aLi.length; i++) {
                        aLi[i].className = '';  //循环清空li样式
                        aDiv[i].style.display = 'none';  //循环隐藏所有div
                    }
                    this.className = 'active';  //当前点击的元素样式变成active
                    aDiv[this.index].style.display = 'block';    //this.index 获取当前li对应的索引
                }
            }
        }
    </script>
    <script src="../js/details.js"></script>


</div>
</body>
</html>
