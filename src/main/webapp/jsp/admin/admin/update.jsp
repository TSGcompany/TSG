<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<head>
		<meta charset="UTF-8">
		<title>修改基本信息</title>
<link href="../css/stylee.css" rel="stylesheet" type="text/css" />
        <!-- 导入kindEditor所需插件 -->
        <link rel="stylesheet" href="<%=basePath%>plugins/kindeditor-4.1.10/themes/default/default.css"/>
        <script src="<%=basePath %>plugins/kindeditor-4.1.10/kindeditor-min.js"></script>
        <script src="<%=basePath%>plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>
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
        <script>
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
                            clickFn: function (admin_head, title, width, height, border, align) {
                                K('#admin_head').val(admin_head);
                                editor.hideDialog();
                            }
                        });
                    });
                });
            });

        </script>
</head>
 
<body>
<div class="ane">
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">修改基本信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form id="baseupdateform" method="post">
    <ul class="forminfo">
    <li><label>*昵称</label><input name="admin_nickname" id="admin_nickname" type="text" class="dfinput" value="${sessionScope.admin.admin_nickname}" /></li>
     <li><label>*手机号</label><input name="admin_phone"id="admin_phone" type="text" class="dfinput" value="${sessionScope.admin.admin_phone}"/></li>
     <li><label>*头像</label>
    <input id="admin_head" name="admin_head" type="text" class="dfinput" value="${sessionScope.admin.admin_head}" />
        <input type="button" id="image1" class="dfinput" style="width:120px;" value="点我选择图片" />	
        <a href="#" id="clearImagePath1">清除选择图片路径</a>	
        <i></i>
    </li>
    <li><label>*邮箱</label><input name="admin_Email" id="admin_Email" type="email" class="dfinput" value="${sessionScope.admin.admin_Email}"/></li>
    <li><label>&nbsp;</label><input name="updatebase" id="updatebase" type="submit" class="btn" value="确认修改"/></li>
    </ul>
    
    </form>
    </div>
    </div>
</body>
</html>
