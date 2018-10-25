<!DOCTYPE html>
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<script src='<%=basePath%>jsp/admin/js/jquery.min.js'></script>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="<%=basePath %>jsp/admin/css/stylee.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>jsp/admin/css/fenye.css"/>
    <!-- <script type="text/javascript" src="js/jquery.js""></script>-->
    <script type="text/javascript" src="<%=basePath %>jsp/admin/js/jquery.js"></script>
    <script src='<%=basePath%>jsp/admin/js/jquery.min.js'></script>
    <script>

        $(document).ready(function() {
            //用于弹出窗口，将服务器返回的数据提交，本处用于账户提交后的状态

            //删除产品事件
            $("a[name='deleteAdmin_buttn']").click(function () {
                var $this = $(this);
                var judge = window.confirm('确定要删除吗？删除后无法恢复！');//提示  点击确定就返回true
                if (judge == true) {
                    //获取当前点击的对象 根据点击的对象来获取对象中某一个字段
                    $.get($(this).attr("href"), function (data) {//根据服务端传过来的值 判断是否删除成功
                        if (data.deleteAdmin == 1) {//表示可以删除
                            alert("删除失败无法删除自己！")
                        } else {
                            alert("删除成功！");
                            $this.parent().parent().remove();
                        }
                    });//获取当前点击对象  获取它字段中href的值 get  方法与post方法相同
                }
                return false;//点击取消的的时候让跳转地址失效
            });
        });
    </script>
</head>


<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">所有书籍</a></li>
    </ul>
</div>
<div class="rightinfo">

    <table class="tablelist">
        <thead>
        <tr>
            <th style="width:20%;">头像</th>
            <th style="width:15%;">用户名</th>
            <th style="width:20%;">手机号</th>
            <th style="width:20%;">邮箱</th>


            <th>操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="i" items="${AdminShow}">
            <tr>
                <td class="img_td">

                    <img src="${i.admin_head}"
                         style="width:35px;height:35px;margin-top: 8px;margin-left: 8px; border-radius: 50px;"/>

                </td>
                <td>${i.admin_nickname}</td>
                <td>${i.admin_phone}</td>
                <td>${i.admin_Email}</td>
                <td><a href="<%=basePath %>admin/goupdateubase?id=${i.id}" class="tablelink">修改</a>
                    <a href="<%=basePath %>admin/deleteAdmin?id=${i.id}" id="deleteAdmin_buttn" name="deleteAdmin_buttn" class="tablelink">
                        删除</a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
<!--分页-->
<div class="page_container center">
    <div class="page_btn prev_page left"><a class="page_btn prev_page left"
                                            href="<%=basePath%>admin/AdminShow?index=${indexPage-1}">上一页</a></div>
    <div class="page_num_container left" id="page_num_container">
        <ul>


            <c:forEach var="i" begin="1" end="${PageCount}" step="1">
                <li><a href="<%=basePath%>admin/AdminShow?index=${i-1}">${i}</a></li>
            </c:forEach>


        </ul>
    </div>
    <div class="page_btn next_page left"><a href="<%=basePath%>admin/AdminShow?index=${indexPage+1}">下一页</a></div>

    <div class="page_btn all_page right">共${PageCount}页</div>


</div>
<script src="<%=basePath %>jsp/admin/js/fenye.js"></script>
</body>
</html>
