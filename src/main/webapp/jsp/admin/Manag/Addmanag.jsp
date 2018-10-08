<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<head>
		<meta charset="UTF-8">
		<title>添加书籍</title>
<link href="../css/stylee.css" rel="stylesheet" type="text/css" />


<!-- 导入kindEditor所需插件 -->	
<link rel="stylesheet" href="<%=basePath%>plugins/kindeditor-4.1.10/themes/default/default.css" />
<script src="<%=basePath%>plugins/kindeditor-4.1.10/kindeditor-min.js"></script>
<script src="<%=basePath%>plugins/kindeditor-4.1.10/lang/zh_CN.js"></script>

<script>
	     //实现kindeditor弹出图片上传窗口
	KindEditor.ready(function(K) {  
				var editor = K.editor({//图片上传
				     //指定上传文件的服务器端程序。
	                uploadJson:  '<%=basePath%>plugins/kindeditor-4.1.10/jsp/upload_json.jsp',
	                //指定浏览远程图片的服务器端程序
	                fileManagerJson: '<%=basePath%>plugins/kindeditor-4.1.10/jsp/file_manager_json.jsp',
	                //是否允许进行文件管理
					allowFileManager : true
				});
				K('#image1').click(function() {
					editor.loadPlugin('image', function() {//动态加载插件，image为插件名
						editor.plugin.imageDialog({						 
						    showLocal : true,//是否显示本地图片上传窗口
						    showRemote : true,//是否显示网络图片窗口	
						    fillDescAfterUploadImage:false,//个人建议只在文本编辑器中使用true，true时图片上传成功后切换到图片编辑标签，false时插入图片后关闭弹出框。					 
							imageUrl : K('#url1').val(),
							clickFn : function(url, title, width, height, border, align) {							   
								K('#url1').val(url);
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
    <li><a href="<%=basePath%>admin/adminmanag/toManagAdmin">添加管理员</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>添加管理员</span></div>
    <form action="<%=basePath%>admin/adminmanag/doAddAdmin" method="post">
    <ul class="forminfo">
    <li><label>*名字</label><input name="" type="text" class="dfinput" value="" /></li>
     <li><label>*手机号</label><input name="" type="text" class="dfinput" value=""/></li>
     <li><label>*头像</label>
    <input id="url1" name="" type="text" class="dfinput" value="" />
        <input type="button" id="image1" class="dfinput" style="width:120px;" value="点我选择图片" />	
        <a href="#" id="clearImagePath1">清除选择图片路径</a>	
        <i></i>
    </li>
    <li><label>*邮箱</label><input name="" type="email" class="dfinput" value=""/></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认添加"/></li>
    </ul>
    </form>
    </div>
</body>
</html>
