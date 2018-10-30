<%--
  Created by IntelliJ IDEA.
  User: S6203-1-08
  Date: 2018/10/15
  Time: 11:13
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
    <title>热门部分</title>
    <script src="<%=basePath%>jsp/shop/js/jquery-1.12.4.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/mid_hot.css"/>
    <script>
        $(document).ready(function () {

            setInterval("startRequest()", 10000);//10秒刷新一下书名字的内容

            //======================搜索=====================
            $("#search").click(function () {//点击搜索按钮时
                var book_name = $(this).parent().find("input").val();//当前点击的这个按钮 的父类 下面的input 值\
                var placeholder_name = $(this).parent().find("input").attr("placeholder");//获取默认提示框内的值
                var book_type_id = $(this).parent().parent().find("select").val();//获取类型的id
//                if(book_name=="" || book_name.length<1){//如果用户没输入的话就将提示框的值设置为搜索的值
//                    book_name=placeholder_var;
//                }

                $("#cc", parent.document.body).attr("src", "<%=basePath%>shop/SearchBookWhereBookType?book_name=" + book_name + "&book_type_id=" + book_type_id + "&placeholder_name=" + placeholder_name + "")
                // $.get("<%=basePath%>shop/SearchBookWhereBookType", { book_name: book_name, book_type_id: book_type_id} );


            });


            //点击图书推荐的的时候刷新界面
            $("#Refresh_Click").click(function () {

                $("#cc", parent.document.body).attr("src", "<%=basePath%>shop/getShopIndexBook?index=0")
            });

        });

        //提示框随机提示书的内容
        function startRequest() {
            $.get("<%=basePath%>shop/RefreshInputValue", function (data) {

                $("#searchInput").attr("placeholder", data.RefreshInputValue);//更新提示文字
            });
        }
    </script>
</head>
<body>
<div class="ts_cones">
    <a>
        <div class="topit1">
            <img src="<%=basePath%>jsp/shop/img/rd1.png"/>
            <h3>热门推荐</h3>
        </div>
    </a>
    <a>
        <div class="topit2">
            <h3>图书推荐</h3>
            <img src="<%=basePath%>jsp/shop/img/rd2.png"/>
        </div>
    </a>
    <a >
        <div class="topit3" id="Refresh_Click">
            <h3>阅读荐书</h3>
            <img src="<%=basePath%>jsp/shop/img/rd3.png"/>
        </div>
    </a>

    <div class="tsg_input">
        <select name="book_type.id" id="u_input">
            <option value="">请选择</option>
            <c:forEach var="i" items="${getBookType}">
                <option value="${i.id}">${i.book_type_name}</option>
            </c:forEach>
        </select>

        <div id="tsg_mane">
            <input name="search" id="searchInput" value="" placeholder="${getBookRandomName}">
            <div id="search">搜索</div>
        </div>
    </div>

</div>

</body>
</html>
