<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/9 0009
  Time: 下午 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>右边</title>
    <link rel="stylesheet" href="<%=basePath%>jsp/customer/css/right.css">
    <link href="<%=basePath%>jsp/customer/css/stylee.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="right_time">
    <div class="formtitle"><span>个人资料</span></div>
    <div class="right_donw">
        <div class="img_head"><img src="../images/tx.jpeg"></div>
        <div class="right_dom">
            <ul>
                <li>用户名：xxx</li>
                <li>手&nbsp;&nbsp;&nbsp;机：xxxxx</li>
                <li>邮&nbsp;&nbsp;&nbsp;箱：xxxxx</li>
            </ul>
            <form class="contact_form" action="#" method="post" name="contact_form">
                <li class="usually">
                    <span>昵称:</span>
                    <input type="text" id="name" name="name" required/>
                </li>
                <li class="usually">
                    <span>姓名:</span>
                    <input type="text" id="full_name" name="full_name" required/>
                </li>
                <li class="special">
                    <span >性别:</span>
                    <input type="radio" name="sex" id="male" checked/>
                    <label for="male">男</label>
                    <input type="radio" name="sex" id="female" />
                    <label for="female">女</label>

                </li>
                <li class="usually">
                    <span>年龄:</span>
                    <input type="number" name="age" required/>
                </li>
                <li class="usually">
                    <span>密码:</span>
                    <input type="password" name="password" required/>
                </li>
                <li class="usually">
                    <span>电子邮箱:</span>
                    <input type="email" name="email" placeholder="javin@example.com" required/>
                </li>
                <li class="usually">
                    <span>联系电话:</span>
                    <input type="text" id="Telephone " name="Telephone " required/>
                </li>


                <li >
                    <button class="submit" type="submit">保存修改</button>
                </li>
            </form>
        </div>
    </div>


</div>

</body>
</html>
