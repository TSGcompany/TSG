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
<html>
<head>
    <meta charset="UTF-8">
    <title>右边</title>
    <link rel="stylesheet" href="<%=basePath%>jsp/customer/css/right.css">
    <link href="<%=basePath%>jsp/customer/css/stylee.css" rel="stylesheet" type="text/css" />
    <link href="../css/stylee.css" rel="stylesheet" type="text/css" />
    <!-- 导入kindEditor所需插件 -->
    <link rel="stylesheet" href="<%=basePath%>plugins/kindeditor-4.1.10/themes/default/default.css"/>
    <script src="<%=basePath %>plugins/kindeditor-4.1.10/kindeditor-min.js"></script>
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script src="<%=basePath%>jsp/admin/js/jquery.min.js"></script>
    <script language=JavaScript>
        $(document).ready(function() {
            $("#updatebase").click(function () {
                var customer_nickname = $("#customer_nickname").val();
                var customer_Email = $("#customer_Email").val();
                var customer_phone = $("#customer_phone").val();

                var status = false;
                if (customer_nickname.length == 0 || customer_nickname == '') {
                    alert("昵称不能为空")
                    status = false;
                } else if (customer_Email.length == 0 || customer_Email == '') {
                    alert("邮箱不能为空")
                    status = false;
                } else if (customer_phone.length == 0 || customer_phone == '') {
                    alert("电话不能为空")
                    status = false;
                } else {
                    status = true;
                }
                if (status==true) {
                    $.post("<%=basePath%>user/updateCustomer", $("#updateform").serialize(), function (data) {
                        if(data.massage==1){
                            alert("修改成功！");
                            parent.location.reload();
                        }else{
                            alert("用户名已存在，请重新输入！");
                        }
                    });//获取当前点击对象  获取它字段中href的值 get  方法与post方法相同
                }
                return false;//点击取消的的时候让跳转地址失效
            });
        });
        //实现kindeditor弹出图片上传窗口
        KindEditor.ready(function (K) {
            var editor = K.editor({//图片上传
                //指定上传文件的服务器端程序。
                uploadJson: '<%=basePath%>plugins/kindeditor-4.1.10/jsp/upload_json.jsp',
                //指定浏览远程图片的服务器端程序
                fileManagerJson: '<%=basePath%>plugins/kindeditor-4.1.10/jsp/file_manager_json.jsp',
                //是否允许进行文件管理
                allowFileManager: true
            });
            K('#image1').click(function () {
                editor.loadPlugin('image', function () {//动态加载插件，image为插件名
                    editor.plugin.imageDialog({
                        showLocal: true,//是否显示本地图片上传窗口
                        showRemote: true,//是否显示网络图片窗口
                        fillDescAfterUploadImage: false,//个人建议只在文本编辑器中使用true，true时图片上传成功后切换到图片编辑标签，false时插入图片后关闭弹出框。
                        imageUrl: K('#customer_head').val(),
                        clickFn: function (url, title, width, height, border, align) {
                            K('#customer_head').val(url);
                            $('#customer_head1').attr("src", url);
                            editor.hideDialog();
                        }
                    });
                });
            });
        });
    </script>
</head>
<body>
<div class="right_time">
    <div class="formtitle"><span>个人资料</span></div>
    <form id="updateform" method="post">
    <div class="right_donw">
        <div class="img_head" id="image1">
            <img src="${sessionScope.customer.customer_head}" id="customer_head1"></div>
        <div class="right_dom">
            <ul>
                <li>用户名：${sessionScope.customer.customer_name}</li>
                <li>手&nbsp;&nbsp;&nbsp;机：${sessionScope.customer.customer_phone}</li>
                <li>邮&nbsp;&nbsp;&nbsp;箱：${sessionScope.customer.customer_Email}</li>
            </ul>
                <li class="usually">
                    <span>昵称:</span>
                    <input type="text" id="customer_nickname" name="customer_nickname" required value="${sessionScope.customer.customer_nickname}"/>
                </li>
            <input id="customer_head" name="customer_head" type="text" class="dfinput" value="${sessionScope.customer.customer_head}" readonly="readonly" style="display:none" />

               <c:choose>
                   <c:when test="${sessionScope.customer.customer_sex==true}">

                       <li class="special">
                           <span >性别:</span>
                           <input type="radio" name="sex" checked/>
                           <label for="male">男</label>
                           <input type="radio" name="sex" />
                           <label for="female">女</label>

                       </li>
                   </c:when>
                   <c:otherwise>
                       <li class="special">
                           <span >性别:</span>
                           <input type="radio" name="sex" id="male"/>
                           <label for="male">男</label>
                           <input type="radio" name="sex" id="female"  checked/>
                           <label for="female">女</label>

                       </li>

                   </c:otherwise>

               </c:choose>


                <li class="usually">
                    <span>电子邮箱:</span>
                    <input type="email" id="customer_Email" name="customer_Email" placeholder="javin@example.com" required value="${sessionScope.customer.customer_Email}"/>
                </li>
                <li class="usually">
                    <span>联系电话:</span>
                    <input type="text" id="customer_phone" name="customer_phone" required value="${sessionScope.customer.customer_phone}"/>
                </li>


                <li >
                    <button class="submit" type="button" id="updatebase" name="updatebase">保存修改</button>
                </li>
        </div>
    </div>
    </form>

</div>

</body>
</html>
