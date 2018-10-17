<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/3 0003
  Time: 下午 6:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <title>头部</title>
    <link href="<%=basePath %>jsp/admin/css/stylee.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="<%=basePath %>jsp/admin/js/jquery.js"></script>
    <script type="text/javascript">
        $(function(){
            //顶部导航切换
            $(".nav li a").click(function(){
                $(".nav li a.selected").removeClass("selected")
                $(this).addClass("selected");
            })
        })
    </script>


</head>
<body style="background:url(images/top.gif) repeat-x;">

<div class="topleft">
    <a href="main.html" target="_parent"><img src="<%=basePath %>jsp/admin/images/lcvclogo.png" title="系统首页" /></a>
</div>

<ul class="nav">
    <li><a href="default.html" target="rightFrame" class="selected"><img src="<%=basePath %>jsp/admin/images/ico01.png" title="书籍管理" /><h2>书籍管理</h2></a></li>
    <li><a href="imgtable.html" target="rightFrame"><img src="<%=basePath %>jsp/admin/images/ico02.png" title="图书查询" /><h2>图书查询</h2></a></li>
    <li><a href="imglist.html"  target="rightFrame"><img src="<%=basePath %>jsp/admin/images/ico03.png" title="模块设计" /><h2>读者挂失</h2></a></li>
    <li><a href="tools.html"  target="rightFrame"><img src="<%=basePath %>jsp/admin/images/ico04.png" title="常用工具" /><h2>书标打印</h2></a></li>
    <li><a href="computer.html" target="rightFrame"><img src="<%=basePath %>jsp/admin/images/ico05.png" title="文件管理" /><h2>读者管理</h2></a></li>
    <li><a href="tab.html"  target="rightFrame"><img src="<%=basePath %>jsp/admin/images/ico06.png" title="系统设置" /><h2>系统设置</h2></a></li>
</ul>

<div class="topright">
    <ul>
        <li><span><img src="<%=basePath %>jsp/admin/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
        <li><a href="<%=basePath %>admin/logout" target="_parent">退出</a></li>
    </ul>

    <div class="user">

        <div class="img_head"><img src="${sessionScope.admin.admin_head}"/></div>
        <span>欢迎${sessionScope.admin.admin_nickname}</span>
        <i>消息</i>
        <b>5</b>
    </div>


</div>
</body>
</html>
