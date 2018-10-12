<!DOCTYPE html>
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src='<%=basePath%>jsp/admin/js/jquery.min.js'></script>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="<%=basePath %>jsp/admin/css/stylee.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>jsp/admin/css/fenye.css" />
    <!-- <script type="text/javascript" src="js/jquery.js""></script>-->
    <script type="text/javascript" src="<%=basePath %>jsp/admin/js/jquery.js"></script>
    <script src='<%=basePath%>jsp/admin/js/jquery.min.js'></script>
    <script>
        $(document).ready(function() {

            $("#updatebase").click(function () {  //点击登录按钮
                var admin_nickname = $("#admin_nickname").val();
                var admin_phone = $("#admin_phone").val();
                var admin_head = $("#admin_head").val();
                var admin_Email = $("#admin_Email").val();
                var status = false;

                if (admin_nickname.length == 0 || admin_nickname == '') {
                    alert("名字不能为空");
                    status = false;
                } else if (admin_phone.length == 0 || admin_phone == '') {
                    alert("电话不能为空")
                    status = false;
                } else if (admin_head.length == 0 || admin_head == '') {
                    alert("头像不能为空")
                    status = false;
                } else if (admin_Email.length == 0 || admin_Email == '') {
                    alert("邮箱不能为空")
                    status = false;
                } else {
                    status = true;
                }

                if (status) {


                    $.post("<%=basePath%>admin/updateubase", $("#baseupdateform").serialize(), function (data) {
                        if (data.massage == 1) {
                            alert("修改成功");
                        } else {
                            alert(data.massage);
                            alert("修改失败");
                        }

                    });

                } else {


                }
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

                        <img src="${i.admin_head}" style="width:35px;height:35px;margin-top: 8px;margin-left: 8px; border-radius: 50px;" />

                </td>
                <td>${i.admin_nickname}</td>
                <td>${i.admin_phone}</td>
                <td>${i.admin_Email}</td>
                <td><a href="<%=basePath %>admin/updateubase?id=${i.id}" class="tablelink">修改</a>     <a href="<%=basePath %>admin/deleteAdmin?id=${i.id}"  class="tablelink"> 删除</a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <div class="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>

        <div class="tipinfo">
            <span><img src="<%=basePath %>admin/images/ticon.png" /></span>
            <div class="tipright">
                <p>是否确认对信息的修改 ？</p>
                <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
        </div>

        <div class="tipbtn">
            <input name="" type="button"  class="sure" value="确定" />&nbsp;
            <input name="" type="button"  class="cancel" value="取消" />
        </div>

    </div>




</div>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
<!--分页-->
<div class="page_container center">
    <div class="page_btn prev_page left"><a class="page_btn prev_page left" href="<%=basePath%>admin/AdminShow?index=${indexPage-1}">上一页</a></div>
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
