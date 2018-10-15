<!DOCTYPE html>
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="<%=basePath %>jsp/admin/css/stylee.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>jsp/admin/css/fenye.css" />
    <!-- <script type="text/javascript" src="js/jquery.js""></script>-->
    <script type="text/javascript" src="<%=basePath %>jsp/admin/js/jquery.js"></script>
    <script src='<%=basePath%>jsp/admin/js/jquery.min.js'></script>
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
        <li><a href="#">用户评论</a></li>
    </ul>
</div>

<div class="rightinfo">

    <table class="tablelist">
        <thead>
        <tr>
            <th style="width:20%;">头像</th>
            <th style="width:15%;">用户名</th>
            <th style="width:20%;">手机号</th>
            <th style="width:20%;">邮箱</th>


            <th>操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="i" items="${CustomerShow}">
            <tr>
                <td class="img_td">

                        <img src="${i.customer_head}" style="width:35px;height:35px;margin-top: 8px;margin-left: 8px; border-radius: 50px;" />

                </td>
                <td>${i.customer_name}</td>
                <td>${i.customer_phone}</td>
                <td>${i.customer_Email}</td>
                <td><a href="" class="tablelink">禁止借书</a>     <a href="" class="tablelink">他的评论</a>     <a href="" class="tablelink">历史借阅</a>     <a href="" class="tablelink"> 删除</a></td>
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
<!--分页-->
<div class="page_container center">
    <div class="page_btn prev_page left"><a class="page_btn prev_page left" href="<%=basePath%>admin/CustomerShow?index=${indexPage-1}">上一页</a></div>
    <div class="page_num_container left" id="page_num_container">
        <ul>


            <c:forEach var="i" begin="1" end="${PageCount}" step="1">
                <li><a href="<%=basePath%>admin/CustomerShow?index=${i-1}">${i}</a></li>
            </c:forEach>


        </ul>
    </div>
    <div class="page_btn next_page left"><a href="<%=basePath%>admin/CustomerShow?index=${indexPage+1}">下一页</a></div>

    <div class="page_btn all_page right">共${PageCount}页</div>


</div>
<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>


</body>
</html>
