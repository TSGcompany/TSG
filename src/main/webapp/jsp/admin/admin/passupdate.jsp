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
<head>
    <meta charset="UTF-8">
    <title>添加书籍</title>
    <link href="<%=basePath %>jsp/admin/css/stylee.css" rel="stylesheet" type="text/css"/>


    <!-- 导入kindEditor所需插件 -->
    <link rel="stylesheet" href="<%=basePath%>plugins/kindeditor-4.1.10/themes/default/default.css"/>
    <script src="<%=basePath %>plugins/kindeditor-4.1.10/kindeditor-min.js"></script>
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/kindeditor-all-min.js"></script>
    <script src='<%=basePath%>jsp/admin/js/jquery.min.js'></script>

    <script>

        $(document).ready(function () {
            //用于弹出窗口，将服务器返回的数据提交，本处用于账户提交后的状态
            $("#UpdatePass_button").click(function () {
                var status = false; //默认表单验证通过

                //对书名名称进行验证
                var name = $("input[name='oldpass']").val();
                if (name == "") {
                    status = false;
                    $("input[name='oldpass']").next().html("旧密码不能为空");
                } else {
                    status = true;
                }

                //对书名名称进行验证
                var name = $("input[name='newpass']").val();
                if (name == "") {
                    status = false;
                    $("input[name='newpass']").next().html("新密码不能为空");
                } else {
                    status = true;
                }

                //对作者名称进行验证
                var name = $("input[name='confirmpass']").val();
                if (name == "") {
                    status = false;
                    $("input[name='confirmpass']").next().html("确认密码不能为空");
                } else {
                    status = true;
                }

                if (status == true) { //如果表单验证通过
                    $.post("<%=basePath%>admin/AdminUpdatePassWord",$("#UpdatePassAdminForm").serialize(),function (data) {
                        if(data.massage == 1){
                            alert("修改成功")

                        }else{
                            alert(data.massage);
                            alert("修改失败")
                        }
                    });
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
        <li><a href="#">管理</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>修改密码</span></div>
    <form id="UpdatePassAdminForm" method="post">
        <ul class="forminfo">

            <li><label>*旧密码</label><input id="oldpass" name="oldpass" type="text" class="dfinput"/><i
            ></i></li>
            <li><label>*新密码</label><input id="newpass" name="newpass" type="text" class="dfinput"/><i
            ></i></li>
            <li><label>*确认密码</label><input id="confirmpass" name="confirmpass" type="text" class="dfinput"/><i
            ></i></li>
            <li><label>&nbsp;</label><input id="UpdatePass_button" name="UpdatePass_button" type="button" class="btn" value="修改密码"/></li>
        </ul>
    </form>
</div>
</body>
</html>
