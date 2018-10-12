<!DOCTYPE html>
<html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
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
        function isNumber(value) { //验证是否为数字
            if (value != "") {
                var patrn = /^(-)?\d+(\.\d+)?$/;
                if (patrn.exec(value) == null || value == "") {
                    return false;
                } else {
                    return true;
                }
            } else {
                return false;
            }
        }

        $(document).ready(function () {
            //用于弹出窗口，将服务器返回的数据提交，本处用于账户提交后的状态
            $("#submit_button").click(function () {
                var status = false; //默认表单验证通过

                //对书名类型进行验证
                var  book_type = $("#book_type").val();
                 if(book_type.length==0||book_type==''){
                     status = false;
                     $("#book_type_message").html("书名类型不能为空");
                 }else{
                     status = true;
                 }
                //对书名名称进行验证
                var name = $("input[name='book_name']").val();
                if (name == "") {
                    status = false;
                    $("input[name='book_name']").next().html("书名名称不能为空");
                } else {
                    status = true;
                }
                //对作者名称进行验证
                var name = $("input[name='book_author']").val();
                if (name == "") {
                    status = false;
                    $("input[name='book_author']").next().html("作者名不能为空");
                } else {
                    status = true;
                }
                //对书的数量进行验证
                var book_number = $("#book_number").val();
                if (isNumber(book_number) == false) {
                    status = false;
                    $("#number_message").html("书的数量必须是数字");
                } else {
                    status = true;
                }

                if (status == true) { //如果表单验证通过
                   $.post("<%=basePath%>admin/AddBook",$("#AddBookForm").serialize(),function (data) {
                       if(data.massage==1){
                          location.href = "<%=basePath%>admin/CustomerShow?index=0";

                       }else{
                           alert(data.massage);
                       }
                   });
                }

            });
            //当点击“清除图片路径”时，将清除图片路径信息

            //当点击“清除图片路径”时，将清除图片路径信息
            $("#clearImagePath1").click(function() {
                $("input[id='book_icon']").attr('value', '');
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
                            imageUrl: K('#book_icon').val(),
                            clickFn: function (url, title, width, height, border, align) {
                                K('#book_icon').val(url);
                                $('#book_image').attr("src", url);
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
        <li><a href="#">书籍类别管理</a></li>
        <li><a href="#">书籍类别添加</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>添加书籍</span></div>
    <form id="AddBookForm" method="post ">
        <ul class="forminfo">
            <li> <img  id="book_image" style="margin-left: 90px" border="1"  width="180px"  height="180px" src="<%=basePath %>jsp/admin/images/Book_default_img.jpg">

                     <input type="button" id="image1" class="dfinput" style="width:120px;" value="点我选择图片"/>
                    <input  type="button"class="btn"  id="clearImagePath1" style="width:120px; color: #FFFFFF" value="清除选择图片路径"/>

            </li>
            <li>
                <label>*书的类型</label>
                <select name="book_type.id" class="dfinput" id="book_type">
                    <option value="">请选择</option>
                    <c:forEach var="i" items="${getBook_TypeAll}">
                        <option value="${i.id}">${i.book_type_name}</option>
                    </c:forEach>
                </select>
                <i id="book_type_message"></i>
            </li>

            </li>

            <li><label>*书名</label><input id="book_name" name="book_name" type="text" class="dfinput"/><i
                    id="name_message"></i></li>
            <li><label>*作者</label><input id="book_author" name="book_author" type="text" class="dfinput"/><i
                    id="author_message"></i></li>
                <input id="book_icon" name="book_icon" type="text" class="dfinput" value="" readonly="readonly" style="display:none" />

            <li><label>*书的数量</label><input id="book_number" name="book_number" type="text" class="dfinput"/><i
                    id="number_message"></i></li>
            <li><label>书本评论</label>
                <textarea id="book_description" name="book_description" cols="" rows="" class="textinput"></textarea><i></i>
            </li>
            <li><label>&nbsp;</label><input id="submit_button" type="button" class="btn" value="添加书籍"/></li>
        </ul>
    </form>
</div>
</body>
</html>
