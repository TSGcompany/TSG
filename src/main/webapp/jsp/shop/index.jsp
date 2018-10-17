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
        window.onload = function () {
            var btn = document.getElementById('btn');
            btn.onclick = function () {
                if (!interval) {
                    this.style.backgroundColor = 'rgb(243, 182, 182)';
                    this.disabled = "disabled";
                    this.style.cursor = "wait";
                    this.value = "重新发送 (" + sleep-- + ")";
                    interval = setInterval(function () {
                        if (sleep == 0) {
                            if (!!interval) {
                                clearInterval(interval);
                                interval = null;
                                sleep = 30;
                                btn.style.cursor = "pointer";
                                btn.removeAttribute('disabled');
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

        //用于弹出窗口，将服务器返回的数据提交，本处用于账户提交后的状态

        function isNumber(value) { //验证是否为数字
            if (value != "") {
                var patrn = /^(-)?\d+(\.\d+)?$/;
                if (patrn.exec(value) == null || value == "") {
                    return false
                } else {
                    return true
                }
            } else {
                return false;
            }
        }

        $(document).ready(function () {

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

                    if ($("#check").is(':checked')) {//看看单选框有没有选中 如果选中返回true 如果没选中返回false
                        $.post("<%=basePath%>admin/login", $("#Loginform").serialize(), function (data) {
                            if (data.AdminLogin== 1) {
                                location.href = "<%=basePath%>admin/ToIndex";
                            } else {
                                alert(data.AdminLogin);
                            }

                        });

                    } else {
                        $.post("<%=basePath%>user/CustomerLogin", $("#Loginform").serialize(), function (data) {
                            if (data.CustomerLogin== 1) {
                                location.href = "<%=basePath%>user/ToIndex";
                            } else {
                                alert(data.CustomerLogin);
                            }

                        });

                    }


                }
            });

        });





        $(document).ready(function () {

            //================验证要注册用户有没有被注册过===========================
            $('#CustomerName').bind('input propertychange', function () {
                var customerName =$("#CustomerName").val();
                $.get("<%=basePath%>register/VerificationUserName?customerName="+customerName,function (data) {
                    if(data.registerMessage== 1){
                        //如果返回1表示有过
                        $('#result').html("该用户名已经被使用！");
                    }else{
                        //没有过就将它设置为空
                        $('#result').html("");
                    }
                });

                //判断有没有使用

            //    $("input[name='getVerificationCode']").removeAttr("disabled");//移除disabled
            });
            //====================邮箱验证===================
            var search_str = /^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/;
            $('#UserEmail').bind('input propertychange', function () {
                var customerName =$("#CustomerName").val();
                var UserEmail = $("#UserEmail").val();
                //看邮箱正不正确并且看该用户名那里有没有值 如果正确，有值就能发送验证码
                if(search_str.test(UserEmail)&&customerName.length>0){
                    $("input[name='getVerificationCode']").removeAttr("disabled");//移除disabled
                }else{
                    $("input[name='getVerificationCode']").attr("disabled");//添加disabled
                }
            });

            //===================================发送验证码====================================
            var VerificationCode;
            $("input[name='getVerificationCode']").click(function () {
                //获取用户邮箱
                var UserEmail = $("#UserEmail").val();
                $.get("<%=basePath%>register/SendVerificationCode?customerEmain="+UserEmail,function (data) {
                    if(data.CodeMessage==1){
                        alert("发送成功，请查收！");
                        VerificationCode= data.VerificationCode;
                        sleep = 0;
                     //  alert(VerificationCode);
                    }else if(data.CodeMessage==3){
                        alert("出错了！");
                        sleep = 0;
                    }else if(data.CodeMessage==2){
                        alert("邮箱为空！");
                        sleep = 0;
                    }
                    if(data.CodeMessage==4){
                        alert("该邮箱不正确或者不存在，请重新输入！");
                        sleep = 0;
                    }
                });
            });
            //===================================点击注册按钮==================================


            $("#Register_btn").click(function () {
                var stud=false;
                var inputVerificationCode = $("#inputVerificationCode").val();
                var CustomerName = $("#CustomerName").val();
                var UserEmail = $("#UserEmail").val();
                var Password= $("#Password").val();
                var Repassword = $("#Repassword").val();
                if (CustomerName.length == 0 || CustomerName == '') {
                    alert("用户名不能为空");
                    stud = false;
                } else if (UserEmail.length == 0 || UserEmail == '') {
                    alert("邮箱不能为空")
                    stud = false;
                } else if(inputVerificationCode.length==0 || inputVerificationCode==''){
                    alert("验证码不能为空")
                    stud = false;
                }else if (Password.length == 0 || Password == '') {
                    alert("密码不能为空")
                    stud = false;
                } else if (Repassword.length==0|| Repassword==''){
                    alert("确认密码不能为空！")
                stud = false;
                } else if(Repassword!=Password){
                    alert("两次密码不一样！")
                    stud = false;
                }else {
                    stud = true;
                }
           //========================提交数据======================================
            if(stud){
                 $.post("<%=basePath%>register/AddCustomer",$("#Register_form").serialize() ,function (data) {
                       if(data.RegAdd_User==1){
                           alert("注册成功！");
                       }
                       if(data.RegAdd_User==2){
                           alert("验证码错误！");
                       }
                       if(data.RegAdd_User==3){
                           alert("两次密码不一致！");
                       }
                       if(data.RegAdd_User==4){
                           alert("该用户名已经被使用！");
                       }
                 });

            }
            });

        });







        //验证要注册用户有没有被注册过
//        $(function () {
//
//            $('#CustomerName').bind('input propertychange', function () {
//
//                $('#result').html("该用户名已经被使用！");
//
//                $("input[name='getVerificationCode']").removeAttr("disabled");//移除disabled
//            });
//
//
//        })
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
<li class="nav_img"><a data-toggle="modal" data-target="#myModal"><img src="<%=basePath%>jsp/shop/img/登录.png"></a></li>
<iframe src="<%=basePath%>jsp/shop/top.jsp" width="100%" height="400px" frameborder="0" name="top" scrolling="no">
</iframe>
<iframe src="<%=basePath%>jsp/shop/mission.jsp" width="100%" height="580px" frameborder="0" name="mission" scrolling="no">
</iframe>
<iframe src="<%=basePath%>jsp/shop/mid_hot.jsp" width="100%" height="50px" frameborder="0" oname="mid_ht" scrolling="no">
</iframe>
<iframe src="<%=basePath%>jsp/shop/middle.jsp" width="100%" height="1109px" frameborder="0" name="middle" scrolling="no">
</iframe>
<iframe src="<%=basePath%>jsp/shop/foot.jsp" width="100%" height="100px" frameborder="0" name="foot" scrolling="no">
</iframe>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel"></h4>
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
                                        <input type="text" required autocomplete="off" id="UserName" name="UserName"
                                               style="height: 40px"/>
                                    </div>

                                    <div class="field-wrap">
                                        <label>
                                            密码<span class="req">*</span>
                                        </label>
                                        <input type="password" required autocomplete="off" id="UserPass" name="UserPass"
                                               style="height: 40px"/>
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

                                <form action="" id="Register_form"method="post">

                                    <div class="field-wrap">
                                        <label>
                                            名字<span class="req">*</span>
                                        </label>
                                        <input type="texe" required autocomplete="off"  name="CustomerName" id="CustomerName" style="height: 40px"/>
                                        <i id="result" style="margin: 150px;width: 200px;color: red"></i>
                                    </div>

                                    <div class="field-wrap">
                                        <label>
                                            邮箱<span class="req">*</span>
                                        </label>
                                        <input type="email" required autocomplete="off" name="UserEmail" id="UserEmail" style="height: 40px"/>
                                    </div>

                                    <div class="field-wrap">
                                        <label>
                                            获取邮箱验证码<span class="req">*</span>
                                        </label>
                                        <input type="text"  id="inputVerificationCode" name="inputVerificationCode" required autocomplete="off" style="height: 40px"/>
                                        <input class="checkCode" type="button"  name="getVerificationCode" disabled id="btn" value="免费获取验证码"/>
                                    </div>

                                    <div class="field-wrap">
                                        <label>
                                            密码<span class="req">*</span>
                                        </label>
                                        <input type="Password" id="Password" name="Password" required autocomplete="off" style="height: 40px"/>
                                    </div>

                                    <div class="field-wrap">
                                        <label>
                                            确认密码<span class="req">*</span>
                                        </label>
                                        <input type="password" id="Repassword" name="Repassword" required autocomplete="off" style="height: 40px"/>
                                    </div>

                                    <button type="submit" id="Register_btn" class="button button-block"/>
                                    注册</button>

                                </form>

                            </div>

                        </div><!-- tab-content -->

                    </div> <!-- /form -->
            </div>
        </div>
    </div>
</div>
                    <script src='<%=basePath%>jsp/shop/js/jquery.min.js'></script>

                    <script src="<%=basePath%>jsp/shop/js/login.js"></script>
</body>
</html>
