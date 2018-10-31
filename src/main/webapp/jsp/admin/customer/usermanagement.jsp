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
    <script src='<%=basePath%>jsp/admin/js/jquery.min.js'></script>
</head>
<script>
    $(document).ready(function () {
    $('[name=loginvalue]').click(function () {
        var LoginValueUrl=$(this).attr("href");
        var judge = window.confirm('确定要执行吗？');//提示  点击确定就返回true
        if(judge) {
            $.get(LoginValueUrl, function (data) {
                alert(data.LoginValue);
                location.href="<%=basePath%>admin/CustomerShow?index=0";
            });
        }
        return false;//点击取消的的时候让跳转地址失效
    });
        $('[name=borrowingvalue]').click(function () {
            var borrowingValueUrl=$(this).attr("href");
            var judge = window.confirm('确定要执行吗？');//提示  点击确定就返回true
            if(judge) {
                $.get(borrowingValueUrl, function (data) {
                    alert(data.BorrowingValue);
                    location.href="<%=basePath%>admin/CustomerShow?index=0";
                });
            }
            return false;//点击取消的的时候让跳转地址失效
        });

    });


</script>

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

                    <img src="${i.customer_head}"
                         style="width:35px;height:35px;margin-top: 8px;margin-left: 8px; border-radius: 50px;"/>

                </td>
                <td>${i.customer_name}</td>
                <td>${i.customer_phone}</td>
                <td>${i.customer_Email}</td>
                <td>
                    <c:choose>
                    <c:when test="${i.customer_prohibit_Login==true}">

                    <a style="color: red" href="<%=basePath%>admin/RelieveOrProhibitCustomerLogin?customerid=${i.id}&loginvalue=false" name="loginvalue" class="tablelink">解除禁止登录</a>
                    </c:when>

                    <c:otherwise>
                    <a name="loginvalue"
                       href="<%=basePath%>admin/RelieveOrProhibitCustomerLogin?customerid=${i.id}&loginvalue=true"
                       class="tablelink">禁止登录</a>

                    </c:otherwise>

                    </c:choose>

                    <a href="" class="tablelink">他的评论</a>
                    <a href="" class="tablelink">历史借阅</a>
                    <c:choose>
                    <c:when test="${i.customer_prohibit_Borrowing==true}">

                    <a name="borrowingvalue" style="color: red" href="<%=basePath%>admin/RelieveOrProhibitCustomerBorrowing?customerid=${i.id}&borrowingvalue=false" class="tablelink">解除禁止借阅</a>
                    </c:when>

                    <c:otherwise>
                    <a name="borrowingvalue" href="<%=basePath%>admin/RelieveOrProhibitCustomerBorrowing?customerid=${i.id}&borrowingvalue=true" class="tablelink">禁止借阅</a>
                    </c:otherwise>

                    </c:choose>


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
<!--分页-->
<div class="page_container center">
    <div class="page_btn prev_page left"><a class="page_btn prev_page left"
                                            href="<%=basePath%>admin/CustomerShow?index=${indexPage-1}">上一页</a></div>
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
<span style="width: 80px; height:30px;border: 1px solid #ccc;margin-left:590px;margin-top:10px;float: left;"><p>当前页为${indexPage+1}</p></span>
<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>


</body>
</html>
