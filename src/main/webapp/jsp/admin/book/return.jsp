<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
    <meta charset="UTF-8">
    <title>添加书籍</title>
    <link href="<%=basePath %>jsp/admin/css/stylee.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=basePath %>jsp/admin/js/jquery.js"></script>

    <!-- 导入kindEditor所需插件 -->


    <script>
        $(document).ready(function () {
            var  stust=false;
            $("#Return_book_btn").click(function () {

                //判断输入框中有没有值
                if($("#book_id").val()==''||$("#book_id").val().length==0){
                    alert("编号不能为空！");
                    stust=false;
                }else{
                    stust=true;
                }
                if(stust){
                    $.post("<%=basePath%>admin/Return_Book", $("#Return_Book_Form").serialize(), function (data) {

                        if(data.ReturnBook_message==1){
                            alert("还书成功！");
                        }else{
                            alert(data.ReturnBook_message);
                        }
                    });
                }
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
        <li><a href="#">归还书籍</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>归还书籍</span></div>
    <form id="Return_Book_Form" method="post">
        <ul class="forminfo">

            <li><label>*归还书籍</label><input name="book_id" id="book_id" type="text" class="dfinput"
                                           placeholder="请填写书籍编号"/></li>

            <li><label>&nbsp;</label><input name="" id="Return_book_btn" type="submit" class="btn" value="确认归还"/></li>
        </ul>
    </form>
</div>
</body>
</html>
