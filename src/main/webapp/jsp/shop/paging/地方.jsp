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
    <link href="<%=basePath%>jsp/shop/paging/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>jsp/shop/paging/css/amazeui.flat.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/paging/css/zzsc-demo.css">
    <link rel="stylesheet" href="<%=basePath%>jsp/shop/paging/dist/css/am-pagination.css">


    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/middle.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/main.css">
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

                <div id="button">
                    <a href="#">借阅</a>
                </div>
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
<div class="zzsc-container">
    <div class="container" style="padding:2em 0;">
        <section>

            <div id="ampagination-bootstrap"style="margin-top: -70px;margin-left: 290px"></div>
            <pre style="font-weight: bold;" class="showlabel">当前页为: 1</pre>
        </section>
    </div>
</div>

<script src="<%=basePath%>jsp/shop/paging/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="<%=basePath%>jsp/shop/paging/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>jsp/shop/paging/dist/js/am-pagination.js"></script>


<script type="text/javascript">
    var pager = window.amPagination('#ampagination-bootstrap',{
        page:1,
        totals:100,
        pageSize:10,
        theme:'bootstrap'
    });
    pager.onChangePage(function(e){
        jQuery('.showlabel').text('当前页为: '+e.page);
    });

</script>


<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">

</div>






<script src="<%=basePath%>jsp/shop/js/jquery-1.11.0.js"></script>
<script src="<%=basePath%>jsp/shop/js/index.js"></script>
</body>
</html>
