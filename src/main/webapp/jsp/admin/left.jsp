<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/3 0003
  Time: 下午 6:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel='stylesheet' href='<%=basePath %>jsp/admin/css/left.css'>
    <title>Title</title>
</head>
<body>
<aside class="sidebar">
    <div id="leftside-navigation" class="nano">
        <ul class="nano-content">
            <li>
                <a href="#"><i class="fa fa-dashboard"></i><span>lcvc图书借阅系统</span></a>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa-cogs"><img src="images/1.png" alt="" style="margin: 0 0 0 -10px"></i><span>个人信息</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>

                    <li><a href="<%=basePath%>jsp/admin/admin/passupdate.jsp" target="rightFrame">修改密码</a>
                    </li>
                    <li><a href="<%=basePath%>jsp/admin/admin/update.jsp" target="rightFrame">修改基本信息</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa-table"><img src="images/2.png" alt="" style="margin: 0 0 -10px -10px"></i><span>书籍类别管理</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li><a href="<%=basePath%>admin/BookShow?index=0" target="rightFrame">所有书籍</a>
                    </li>
                    <li><a href="<%=basePath%>admin/getBook_TypeAll" target="rightFrame">添加书籍</a>
                    </li>
                    <li><a href="<%=basePath%>jsp/admin/book/return.jsp" target="rightFrame">归还书籍</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa fa-desktop"><img src="images/3.png" alt="" style="margin:0 0 0 -10px"></i><span>管理员模块</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li><a href="<%=basePath%>admin/AdminShow?index=0" target="rightFrame">管理员管理</a>
                    </li>
                    <li><a href="<%=basePath%>jsp/admin/Manag/Addmanag.jsp" target="rightFrame">添加管理员</a>
                    </li>
                </ul>
            <li class="sub-menu">
                <a href="javascript:void(0);"><i class="fa fa fa-user"><img src="images/4.png" alt="" style="margin: 0 0 -10px -10px"></i><span>用户模块</span><i class="arrow fa fa-angle-right pull-right"></i></a>
                <ul>
                    <li><a href="<%=basePath%>admin/CustomerShow?index=0" target="rightFrame">用户管理</a></li>
                    <li><a href="<%=basePath%>jsp/admin/customer/user_reviews.jsp" target="rightFrame">用户评论</a></li>

                </ul>

        </ul>
    </div>
</aside>

<script src='<%=basePath%>jsp/admin/js/jquery.js'></script>

<script  src="<%=basePath%>jsp/admin/js/left.js"></script>

</body>
</html>
