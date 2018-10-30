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
    <title></title>
    <link href="<%=basePath %>jsp/admin/css/stylee.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>jsp/admin/css/fenye.css"/>
    <!-- <script type="text/javascript" src="js/jquery.js""></script>-->
    <script type="text/javascript" src="<%=basePath %>jsp/admin/js/jquery.js"></script>

    <script type="text/javascript">
        //===================================删除书============================


        $(document).ready(function() {
            //用于弹出窗口，将服务器返回的数据提交，本处用于账户提交后的状态

            //删除产品事件
            $("a[name='delete_book']").click(function(){
                var $this=$(this);
                var judge = window.confirm('确定要删除吗？删除后无法恢复');//提示  点击确定就返回true
                if(judge==true){
                    //获取当前点击的对象 根据点击的对象来获取对象中某一个字段
                    $.get($(this).attr("href"),function(data){//根据服务端传过来的值 判断是否删除成功
                        if(data.massage==1){//表示可以删除
                            //ajax 删除 不用通过数据库刷新   所有只要将当前的对象的数据移除就行了
                            //找到当前对象
                            $this.parent().parent().remove();
                        }else{
                            alert(data.massage);
                        }
                    });//获取当前点击对象  获取它字段中href的值 get  方法与post方法相同
                }
                return false;//点击取消的的时候让跳转地址失效
            });


        });
    </script>


</head>


<body>


<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">所有书籍</a></li>
    </ul>
</div>

<div class="rightinfo">
    <table class="tablelist">
        <thead>
        <tr>
            <th style="width:10%;">图片</th>
            <th style="width:15%;">书的类型</th>
            <th style="width:12%;">书的编号</th>
            <th style="width:15%;">书名</th>
            <th style="width:15%;">作者</th>
            <th style="width:10%;">书的数量</th>
            <th style="width:15%;">创建时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="i" items="${BookShow}">
            <tr>
                <td>
                    <img src="${i.book_icon}" style="width:80px;height:60px;"/>
                </td>
                <td>${i.book_type.book_type_name}</td>
                <td>${i.book_id}</td>
                <td>${i.book_name}</td>
                <td>${i.book_author}</td>
                <td>${i.book_number}</td>
                <td><fmt:formatDate value="${i.book_release_Date}" pattern="yyyy年MM月dd日 HH:mm"/></td>
                <td><a href="<%=basePath%>admin/toUpdateBookPage?book_id=${i.id}" class="tablelink">修改</a>
                    <a href="<%=basePath%>admin/deleteBook?book_id=${i.id}"  name="delete_book" class="tablelink"> 删除</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="tip">
        <div class="tiptop"><span>提示信息</span><a></a></div>
        <div class="tipinfo">
            <span><img src="images/ticon.png"/></span>
            <div class="tipright">
                <p>是否确认对信息的修改 ？</p>
                <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
        </div>
        <div class="tipbtn">
            <input name="" type="button" class="sure" value="确定"/>&nbsp;
            <input name="" type="button" class="cancel" value="取消"/>
        </div>

    </div>


</div>

<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
<!--分页-->
<div class="page_container center">
    <c:choose>
        <c:when test="${indexPage==0} ||${indexPage<0}">

            <div class="page_btn prev_page left" ><a class="page_btn prev_page left" href="<%=basePath%>admin/BookShow?index=0">上一页</a></div>

        </c:when>

       <c:when test="${indexPage>0}">
           <div class="page_btn prev_page left" ><a class="page_btn prev_page left" href="<%=basePath%>admin/BookShow?index=${indexPage-1}">上一页</a></div>

       </c:when>

    </c:choose>



    <div class="page_num_container left" id="page_num_container">
        <ul>
            <c:forEach var="i" begin="1" end="${PageCount}" step="1">
                <li><a href="<%=basePath%>admin/BookShow?index=${i-1}">
                <li>${i}</li>
                </a></li>
            </c:forEach>
        </ul>
    </div>
    <c:choose>
        <c:when test="${indexPage==PageCount-1}">
            <div class="page_btn next_page left"><a href="<%=basePath%>admin/BookShow?index=${PageCount-1}">下一页</a></div>

        </c:when>
        <c:when test="${indexPage<PageCount-1}">
           <div class="page_btn next_page left"><a href="<%=basePath%>admin/BookShow?index=${indexPage+1}">下一页</a></div>

        </c:when>



    </c:choose>

    <div class="page_btn all_page right" >共${PageCount}页</div>

</div>
<span style="width: 80px; height:30px;border: 1px solid #ccc;margin-left:590px;margin-top:10px;float: left;"><p>当前页为${indexPage+1}</p></span>

<script src="<%=basePath %>jsp/admin/js/fenye.js"></script>
</body>
</html>
