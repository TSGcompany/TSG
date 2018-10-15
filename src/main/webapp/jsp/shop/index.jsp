<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/8 0008
  Time: 下午 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>图书借阅系统</title>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/top.css">
    <link rel="stylesheet" href="<%=basePath%>jsp/shop/css/normalize.min.css">
    <link rel="stylesheet" href="<%=basePath%>jsp/shop/css/style.css">
    <link rel="stylesheet" href="<%=basePath%>jsp/shop/css/bootstrap.css">
    <script src="<%=basePath%>jsp/shop/js/jquery-1.12.4.js"></script>
    <script src="<%=basePath%>jsp/shop/js/top.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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


                }



            });

        });
    </script>
</head>
<!--<frameset rows="900,900,900," cols="*" frameborder="no" border="0" framespacing="0">
<frame src="top.html" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
<frame src="mission.html" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame" />
<frame src="middle.html" name="rightFrame" scrolling="No" id="rightFrame" title="rightFrame" "/>
<frame src="foot.html" name="rightFrame" scrolling="No" id="rightFrame" title="rightFrame" />
</frameset>
</frameset>
<noframes>-->
<body>
<li class="nav_img"><a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"><img src="img/登录.png"></a></li>
<iframe  src="top.jsp" width="100%" height="400px"   frameborder="0"  name="top"     scrolling="no">
</iframe>
<iframe  src="mission.jsp" width="100%" height="580px"   frameborder="0"  name="mission"     scrolling="no">
</iframe>
<iframe  src="middle.jsp" width="100%" height="1109px"   frameborder="0"  name="middle"     scrolling="no">
</iframe>
<iframe  src="foot.jsp" width="100%" height="100px"   frameborder="0"  name="foot"     scrolling="no">
</iframe>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
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

                    <script  src="<%=basePath%>jsp/shop/js/login.js"></script>
</body>
</html>
