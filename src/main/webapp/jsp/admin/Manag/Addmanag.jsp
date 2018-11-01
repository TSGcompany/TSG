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
            $("#admin_button").click(function () {
                var status = false; //默认表单验证通过

                //对书名名称进行验证
                var name = $("input[name='admin_name']").val();
                if (name == "") {
                    status = false;
                    $("input[name='admin_name']").next().html("名称不能为空");
                } else {
                    status = true;
                }

                //对书名名称进行验证
                var name = $("input[name='admin_password']").val();
                if (name == "") {
                    status = false;
                    $("input[name='admin_password']").next().html("密码不能为空");
                } else if (name!=$("input[name='r_password']").val()){
                    $("input[name='r_password']").next().html("两次密码不一样");

                }else{
                    status = true;
                }




                //对作者名称进行验证
                var name = $("input[name='admin_phone']").val();
                if (name == "") {
                    status = false;
                    $("input[name='admin_phone']").next().html("电话不能为空");
                } else {
                    status = true;
                }
                //对作者名称进行验证
                var name = $("input[name='admin_Email']").val();
                if (name == "") {
                    status = false;
                    $("input[name='admin_Email']").next().html("邮箱名不能为空");
                } else {
                    status = true;
                }

                if (status == true) { //如果表单验证通过
                    $.post("<%=basePath%>admin/AddAdmin",$("#AddAdminForm").serialize(),function (data) {
                        if(data.massage == 1){
                     alert("添加成功")

                        }else{
                            alert(data.massage);
                            alert("添加失败")
                        }
                    });
                }

            });
            //当点击“清除图片路径”时，将清除图片路径信息

            //当点击“清除图片路径”时，将清除图片路径信息
            $("#clearIconPath").click(function() {
                $("#admin_head").attr('value', ' ');
                $('#admin_head1').attr("src", "");
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
                        imageUrl: K('#admin_head').val(),
                        clickFn: function (url, title, width, height, border, align) {
                            K('#admin_head').val(url);
                            $('#admin_head1').attr("src", url);
                            editor.hideDialog();
                        }
                    });
                });
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

    <div class="formtitle"><span>添加管理员</span></div>
    <form id="AddAdminForm" method="post">
        <ul class="forminfo">
            <li><label>*头像</label>
            <li> <img  id="admin_head1" style="margin-left:  90px" border="1"  width="180px"  height="180px" src="<%=basePath %>jsp/admin/images/Book_default_img.jpg">
                <input type="button" id="image1" class="dfinput" style="width:120px;" value="点我选择图片"/>
                <input  type="button"class="btn"  id="clearImagePath1" style="width:120px; color: #FFFFFF" value="清除选择图片路径"/>

                <i></i>
            </li>
            <input id="admin_head" name="admin_head" type="text" class="dfinput" value="" readonly="readonly" style="display:none" />
            <li><label>*名字</label><input id="admin_name" name="admin_name" type="text" class="dfinput"/><i
                    ></i></li>
            <li><label>*密码</label><input id="admin_password" name="admin_password" type="password" class="dfinput"/><i
            ></i></li>
            <li><label>*确认密码</label><input id="r_password" name="r_password" type="password" class="dfinput"/><i
            ></i></li>
            <li><label>*电话</label><input id="admin_phone" name="admin_phone" type="text" class="dfinput"/><i
                   ></i></li>
            <li><label>*邮箱</label><input id="admin_Email" name="admin_Email" type="text" class="dfinput"/><i
                    ></i></li>
            <li><label>&nbsp;</label><input id="admin_button" type="button" class="btn" value="添加管理员"/></li>
        </ul>
    </form>
</div>
</body>
</html>
