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
        <script src="<%=basePath %>plugins/kindeditor-4.1.10/kindeditor-min.js"></script>
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
    <li><a href="#">管理员管理</a></li> 
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    	<ul class="toolbar">
        <li class="click">
           <a href="Addmanag.jsp">
          <span><img src="../images/t01.png" /></span>添加管理员
          </a>
          </li>
        </ul>
        
        
      
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th style="width:3%;"><input name="" type="checkbox" value="" checked="checked"/></th>
        <th style="width:15%;">名字</th>
        <th style="width:20%;">手机号</th>
        <th style="width:25%;">头像</th>
        <th style="width:25%;">邮箱</th>
       
        <th>操作</th>
        </tr>
        </thead>
        
        <tbody>
         <c:forEach var="" items="">
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
        <td><a href="../admin/update.jsp" class="tablelink">修改</a>     <a href="" class="tablelink"> 删除</a></td>
        </tr> 
        </c:forEach> 
        </tbody>
    </table>
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
