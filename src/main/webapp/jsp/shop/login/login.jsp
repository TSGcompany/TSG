<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/8 0008
  Time: 下午 1:04
  To change this template use File | Settings | File Templates
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="<%=basePath%>jsp/shop/css/normalize.min.css">
    <link rel="stylesheet" href="<%=basePath%>jsp/shop/css/style.css">
    <script src='<%=basePath%>jsp/shop/js/jquery.min.js'></script>
    <style type="text/css">
        .checkCode {
            cursor: pointer;
            border: 1px solid #FFFFFF;
            float: right;
            margin: -41px 0 0 0;
            line-height: 26px;
            width: 180px;
            height: 40px;
        }
    </style>
    <script type="text/javascript">
        var sleep = 30, interval = null;
        window.onload = function ()
        {
            var btn = document.getElementById ('btn');
            btn.onclick = function ()
            {
                if (!interval)
                {
                    this.style.backgroundColor = 'rgb(243, 182, 182)';
                    this.disabled = "disabled";
                    this.style.cursor = "wait";
                    this.value = "重新发送 (" + sleep-- + ")";
                    interval = setInterval (function ()
                    {
                        if (sleep == 0)
                        {
                            if (!!interval)
                            {
                                clearInterval (interval);
                                interval = null;
                                sleep = 30;
                                btn.style.cursor = "pointer";
                                btn.removeAttribute ('disabled');
                                btn.value = "免费获取验证码";
                                btn.style.backgroundColor = '';
                            }
                            return false;
                        }
                        btn.value = "重新发送 (" + sleep-- + ")";
                    }, 1000);
                }
            }
        }
    </script>
    <script>
        //用于弹出窗口，将服务器返回的数据提交，本处用于账户提交后的状态

        function isNumber(value) { //验证是否为数字
            if(value != "") {
                var patrn = /^(-)?\d+(\.\d+)?$/;
                if(patrn.exec(value) == null || value == "") {
                    return false
                } else {
                    return true
                }
            } else {
                return false;
            }
        }

        $(document).ready(function() {

            $("#LoginBtn").click(function () {  //点击登录按钮
                var UserPass = $("#UserPass").val();
                var UserName = $("#UserName").val();
                var status = false;

                if (UserName.length ==0||UserName=='') {
                    alert("用户名不能为空");
                    status = false;
                }else if(UserPass.length ==0||UserPass==''){
                    alert("密码不能为空")
                    status = false;
                }else{
                    status  =true;
                    }

                if (status) {
                }
                if ($("#check").is(':checked')) {//看看单选框有没有选中 如果选中返回true 如果没选中返回false
                    $.post("<%=basePath%>admin/login", $("#Loginform").serialize(), function (data) {
                        if (data.AdminLogin== 1) {
                            location.href = "<%=basePath%>admin/ToIndex";
                        } else {
                            alert(data.AdminLogin);
                        }

                    });

                } else {
                    $.post("<%=basePath%>user/Userlogin", $("#Loginform").serialize(), function (data) {
                        if (data.CustomerLogin == 1) {
                            location.href = "<%=basePath%>user/ToIndex";
                        } else {
                            alert(data.CustomerLogin);
                        }

                    });
                }



            });

        });



    </script>

</head>
<body style="background: url(<%=basePath%>jsp/shop/img/beijin.jpg)">
<div style="text-align:center;clear:both">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>

<div class="form">

    <ul class="tab-group">
        <li class="tab active"><a href="#login">登录</a></li>
        <li class="tab"><a href="#signup">注册</a></li>
    </ul>

    <div class="tab-content">


        <div id="login">
            <h1>欢迎登录!</h1>

            <form action="/" id="Loginform" method="post">

                <div class="field-wrap">
                    <label>
                        名字<span class="req">*</span>
                    </label>
                    <input type="text" required autocomplete="off" id="UserName" name="UserName" style="height: 40px"/>
                </div>

                <div class="field-wrap">
                    <label>
                        密码<span class="req">*</span>
                    </label>
                    <input type="password" required autocomplete="off" id="UserPass" name="UserPass" style="height: 40px"/>
                </div>

                <form class="contact_form" action="#" method="post" name="contact_form">
                    <li class="special">
                        <input type="checkbox" name="vehicle" id="check" value="Car"/>管理员
                    </li>

                </form>
                <p class="forgot"><a href="#">忘记密码?</a></p>

                <button class="button button-block" id="LoginBtn"/>
                登录</button>

            </form>

        </div>


        <div id="signup">
            <h1>免费注册</h1>

            <form action="/" method="post">

                <div class="field-wrap">
                    <label>
                        名字<span class="req">*</span>
                    </label>
                    <input type="texe" required autocomplete="off" style="height: 40px"/>
                </div>

                <div class="field-wrap">
                    <label>
                        邮箱<span class="req">*</span>
                    </label>
                    <input type="email" required autocomplete="off" style="height: 40px"/>
                </div>

                <div class="field-wrap">
                    <label>
                        获取邮箱验证码<span class="req">*</span>
                    </label>
                    <input type="email" required autocomplete="off" style="height: 40px"/><input class="checkCode" type="button" id="btn" value="免费获取验证码" />
                </div>

                <div class="field-wrap">
                    <label>
                        密码<span class="req">*</span>
                    </label>
                    <input type="password" required autocomplete="off" style="height: 40px"/>
                </div>

                <div class="field-wrap">
                    <label>
                        确认密码<span class="req">*</span>
                    </label>
                    <input type="password" required autocomplete="off" style="height: 40px"/>
                </div>

                <button type="submit" class="button button-block"/>
                注册</button>

            </form>

        </div>

    </div><!-- tab-content -->

</div> <!-- /form -->
<script src='<%=basePath%>jsp/shop/js/jquery.min.js'></script>

<script src="<%=basePath%>jsp/shop/js/login.js"></script>

</body>
</html>
