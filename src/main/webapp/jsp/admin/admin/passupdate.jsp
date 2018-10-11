
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
<link href="<%=basePath%>jsp/admin/css/stylee.css" rel="stylesheet" type="text/css" />
        <script src='<%=basePath%>jsp/admin/js/jquery.min.js'></script>
        <script>
            $(document).ready(function() {

                $("#updatepass").click(function () {  //点击登录按钮
                    var oldpass = $("#oldpass").val();
                    var newpass = $("#newpass").val();
                    var confirmpass = $("#confirmpass").val();
                    var status = false;

                    if (oldpass.length == 0 || oldpass == '') {
                        alert("旧密码不能为空");
                        status = false;
                    } else if (newpass.length == 0 || newpass == '') {
                        alert("新密码不能为空")
                        status = false;
                    } else if (confirmpass.length == 0 || confirmpass == '') {
                        alert("确认密码不能为空")
                        status = false;
                    } else {
                        status = true;
                    }

                    if (status) {


                            $.post("<%=basePath%>admin/AdminUpdatePassWord", $("#passupdateform").serialize(), function (data) {
                                if (data.message == 1)
                                {

                                } else {
                                    alert(data.message);
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
    <li><a href="#">修改密码</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
       <form id="passupdateform" method="post">
    <ul class="forminfo">
    <li><label>*旧密码</label><input name="oldpass" id="oldpass" type="text" class="dfinput" /></li>
    <li><label>*新密码</label><input   name="newpass" id="newpass" type="text" class="dfinput" /></li>
     <li><label>*确认密码</label><input name="confirmpass" id="confirmpass" type="text" class="dfinput" /></li>
        <li><label>&nbsp;</label><input name="" id="updatepass" type="submit" class="btn" value="确认修改"/></li>
    </ul>
    </form>
    
    </div>
</body>
</html>
