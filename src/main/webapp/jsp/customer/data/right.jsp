

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
    <title>右边</title>
    <link rel="stylesheet" href="<%=basePath%>jsp/customer/css/right.css">
    <link href="<%=basePath%>jsp/customer/css/stylee.css" rel="stylesheet" type="text/css" />
    <!-- 导入kindEditor所需插件 -->
    <link rel="stylesheet" href="<%=basePath%>plugins/kindeditor-4.1.10/themes/default/default.css"/>
    <script src="<%=basePath %>plugins/kindeditor-4.1.10/kindeditor-min.js"></script>
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
    <script src="<%=basePath%>plugins/kindeditor-4.1.10/kindeditor-all-min.js"></script>
    <script src='<%=basePath%>jsp/customer/js/jquery.min.js'></script>
    <script>
        $(document).ready(function() {

            $("#updatebase").click(function () {  //点击登录按钮
                var customer_nickname = $("#customer_nickname").val();
                var customer_Email = $("#customer_Email").val();
                var customer_phone = $("#customer_phone").val();
                var status = false;

                if (customer_nickname.length == 0 || customer_nickname == '') {
                    alert("名字不能为空");
                    status = false;
                }else if (customer_Email.length == 0 || customer_Email == '') {
                    alert("邮箱不能为空")
                    status = false;
                }else if (customer_phone.length == 0 || customer_phone == '') {
                    alert("手机号不能为空")
                    status = false;
                }else {
                    status = true;
                }

                if (status) {

                    $.post("<%=basePath%>customer/updateCustomer", $("#userupdateform").serialize(), function (data) {
                        if (data.massage == 1){
                            alert("修改成功");

                        } else {
                            alert(data.massage);
                            //alert("修改失败");
                        }

                    });

                } else {


                }
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
    <form class="contact_form" id="userupdateform" action="#" method="post" name="contact_form">
    <div class="right_donw">
        <div class="img_head">
            <img id="customer_head1" src="${sessionScope.Customer.customer_head}">
            <input type="button" id="image1" class="dfinput" style="width:120px;" value="点我选择图片"/>
            <input id="customer_head" name="customer_head" type="text" class="dfinput" value="${sessionScope.Customer.customer_head}" readonly="readonly" style="display:none" />
        </div>
        <div class="right_dom">
            <ul>
                <li>用户名：<input name="customer_name" id="customer_name" value="${sessionScope.Customer.customer_name}" readonly/></li>
                <li>手&nbsp;&nbsp;&nbsp;机：xxxxx</li>
                <li>邮&nbsp;&nbsp;&nbsp;箱：xxxxx</li>
            </ul>

                <li class="usually">
                    <span>昵称:</span>
                    <input type="text" id="customer_nickname" name="customer_nickname" value="${sessionScope.Customer.customer_nickname}"  required/>
                </li>

                <li class="special">
                    <span >性别:</span>

                    <input type="radio" value="0" name="customer_sex" ${sessionScope.Customer.customer_sex=="0" ? "checked='checked'" : ""} />
                    男

                    <input type="radio" value="1" name="customer_sex" ${sessionScope.Customer.customer_sex=="1" ? "checked='checked'" : ""} />
                    女
                </li>


                <li class="usually">
                    <span>电子邮箱:</span>
                    <input type="email" id="customer_Email" name="customer_Email" placeholder="javin@example.com" value="${sessionScope.Customer.customer_Email}"  required/>
                </li>
                <li class="usually">
                    <span>联系电话:</span>
                    <input type="text" id="customer_phone" name="customer_phone" value="${sessionScope.Customer.customer_phone}" required/>
                </li>


            <li >
                <label>&nbsp;</label><input name="updatebase" id="updatebase" type="button" class="btn" value="保存修改"/>
            </li>

        </div>
    </div>

    </form>
</div>

</body>
</html>
