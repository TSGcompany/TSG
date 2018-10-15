<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/8 0008
  Time: 下午 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>头部</title>
    <link rel="stylesheet" href="<%=basePath%>jsp/shop/css/jquery.hiSlider.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/top.css">
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        body{
            font: 18px/2 'Microsoft YaHei', 'Arial';
        }
        li{
            list-style: none;
        }
        li img{
            display: block;
            margin: 0 auto;
        }
        #wrap{
            width: 80%;
            min-width: 300px;
            margin: 10px auto 80px;
            background: #fefefe;
        }
        .hiSlider{
            overflow: hidden;
            height: 350px;
            width: 100%;
            background-image: url(img/zuo.jpg);
        }
        .hiSlider-item img{
            text-align: center;
            width: 1427px;
            height: 350px;
        }
    </style>

</head>
<body>
<div class="nav">

    <div class="navbar">
        <ul>
            <li class="nav_1"><a href="top.html">首页</a></li>
            <li class="nav_1"><a href="#">网上借阅</a></li>
            <li class="nav_1"><a href="#">读者服务</a></li>
            <li class="nav_1"><a href="#">资源动态</a></li>
            <li class="nav_1"><a href="#">讲座/活动</a></li>
            <li class="nav_2"><a href="#" target="_parent">退出</a></li>
            <iframe allowtransparency="true" frameborder="0" width="180" height="36" style="margin: 5px 50px 0 0; float: right;" scrolling="no" src="//tianqi.2345.com/plugin/widget/index.htm?s=3&z=2&t=0&v=0&d=3&bd=0&k=000000&f=ffffff&ltf=ffff00&htf=ff8000&q=1&e=1&a=1&c=54511&w=180&h=36&align=center"></iframe>
        </ul>
    </div>
        </ul>
    </div>
    <ul class="hiSlider hiSlider3">
        <li class="hiSlider-item"><img src="img/01b99b58704e66a801219c77a3a2cd.jpg"></li>
        <li class="hiSlider-item"><img src="img/300000764046129766419739238_950.jpg"></li>
        <li class="hiSlider-item"><img src="img/111_1.jpg"></li>
        <li class="hiSlider-item"><img src="img/ac7ba124478f169ff3762c.JPG"></li>
        <li class="hiSlider-item"><img src="img/banner5.jpg"></li>
        <li class="hiSlider-item"><img src="img/lb3_0.jpg"></li>
    </ul>
    <div style="text-align:center;clear:both">
        <script src="/gg_bd_ad_720x90-2.js" type="text/javascript"></script>
    </div>
</div>

<script src="<%=basePath%>jsp/shop/js/jquery.1.9.1.js"></script>
<script src="<%=basePath%>jsp/shop/js/jquery.hiSlider.min.js"></script>
<script>
    $('.hiSlider1').hiSlider();
    $('.hiSlider2').hiSlider({
        isFlexible: true,
        mode: 'fade',
        isSupportTouch: false,
        isShowTitle: false,
        isShowPage: false,
        titleAttr: function(curIdx){
            return $('img', this).attr('alt');
        }
    });
    $('.hiSlider3').hiSlider({
        isFlexible: true,
        isSupportTouch: true,
        titleAttr: function(curIdx){
            return $('img', this).attr('alt');
        }
    });
    $('.hiSlider4').hiSlider({
        startSlide: 2,
        direction: 'top'
    });
</script>

</body>
</html>