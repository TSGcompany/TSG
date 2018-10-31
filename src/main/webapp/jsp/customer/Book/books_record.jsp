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

    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/customer/css/books.css"/>
    <link href="<%=basePath%>jsp/customer/css/record.css" rel="stylesheet" type="text/css" />
    <script src="<%=basePath%>jsp/customer/js/books.js"></script>
    <script src="<%=basePath%>jsp/customer/js/jquery-1.12.4.js"></script>

</head>
<body>



    <!--<div class="right_evaluate">-->
    <div class="formtitle">
    <div class="tab">
        <div id="box">
            <!--这个ul为选项卡的菜单，提供选择项，并且设置其中一个li为默认样式-->
            <ul class="active">
                <li >所有记录</li>
                <li >已归还</li>
                <li >未归还</li>
            </ul>
            <!--这个div为选项卡的内容，显示不同菜单的不同内容，并且设置其中一个div为可见，其他隐藏-->
            <div id="content">
                <div style="display: block;">
                    <h2 style="font-size: 14px;margin: 15px 10px;height: 30px">
                        所有记录</h2>

                </div>
                <div>
                    <img src="<%=basePath%>jsp/customer/images/ptx.jpg"
                         style="width: 50px;height:50px;border-radius:50px;margin: 10px 10px;">
                    <h2 style="font-size: 14px;margin: -35px 70px; height: 50px">
                        已归还</h2></br></br>
                </div>
                <div style="display: block;">
                    <h2 style="font-size: 14px;margin: 15px 10px;  height: 30px">
                        未归还</h2>
                </div>
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



</div>

</body>
</html>
