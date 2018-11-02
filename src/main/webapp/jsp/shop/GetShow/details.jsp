<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>


<head>
    <meta charset="UTF-8">
    <title>图书馆详情页</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/mission.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/details.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/bookstore.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>jsp/admin/css/fenye.css"/>
    <script src="<%=basePath%>jsp/shop/js/details.js"></script>
    <script src="<%=basePath%>jsp/shop/js/jquery-1.12.4.js"></script>
    <script>
        $(document).ready(function () {
    //当用户没登录时点击借阅按钮
            $("div[name='customerNotLogin']").click(function () {
                location.target="<%=basePath%>jsp/shop/login/login.jsp";
                alert("您尚未登录！")
            });

     //当用户登录之后点击借阅按钮
            $("div[name='customerLogin']").click(function () {
                var book_id=$(this).find("p").text();//获取id
             //   alert(book_id);


                $.get("<%=basePath%>user/BorrowingBook?book_id="+book_id, function (data) {//路径， 返回值
                 //   alert(data.BorrowingMessage);
                    if (data.BorrowingMessage == 1) {
                        alert("借阅成功！")

                    }
                    if (data.BorrowingMessage == 0) {
                        alert("您已经被禁止借书！")
                    }
                    if (data.BorrowingMessage == 2) {
                        alert("每本书只能被借一次！")
                    }
                    if (data.BorrowingMessage == 3) {
                        alert("该书已经借完请联系管理员！")
                    }
                    if (data.BorrowingMessage == 4) {
                        alert("您已经被禁止登陆，无法借阅！")
                    }

                });

            });
        });


    </script>
</head>
<body>


<div class="tsg_details">
    <!--
        作者：offline
        时间：2018-09-25
        描述：右边图片
   -->
    <div class="tsg_picture">
        <img class="circle" src="${getBookDetails.book_icon}" width="300px" height="350px"/>
    </div>
    <!--
        作者：offline
        时间：2018-09-25
        描述：左边简介
   -->
    <div class="synopsis">
        <p>书名：${getBookDetails.book_name}</p></br>
        <p>作者：${getBookDetails.book_author}</p></br>
        <p>可借册数：${getBookDetails.book_number}</p></br>
        <p>评分：（已有0条评论）</p></br>
        <p>简介：</p>
        <div class="brief"
             style="width: 700px; height: 165px;font-size:16px;border: 1px solid #ccc;margin-top: 5px;text-indent:35px">${getBookDetails.book_description}</div>
    </div>
    <!--
        作者：offline
        时间：2018-09-25
        描述：借阅按钮
    -->
<c:choose>
    <c:when test="${sessionScope.customer!=null}">
        <div id="borrow" name="customerLogin" style="margin-top: 400px">
            <a href="">借阅</a>
            <p hidden>${getBookDetails.id}</p>
        </div>

    </c:when>
    <c:otherwise>

        <div id="borrow" name="customerNotLogin" style="margin-top: 400px">
            <a href="">借阅</a>
        </div>
    </c:otherwise>

</c:choose>



    <!--
        作者：offline
        时间：2018-09-25
        描述：预约按钮
    -->
    <div id="make" style="margin-top: 400px">
        <a href="#">预约</a>

    </div>
</div>
</div>
<!--最外边框-->
<div class="rectan">
    <!--图书排行榜小框-->
    <div class="kanle">
        <h3>图书排行榜</h3>
    </div>
    <!--最左边长条框-->
    <div class="list">
        <!--第一部分-->
        <c:forEach items="${recommend_Book}" var="i">
            <a href="<%=basePath%>shop/toBookDetailsPage?book_id=${i.id}" target="_top">
            <div class="book1">
                <div class="item">
                    <div class="pic">
                        <img src="${i.book_icon}">
                    </div>
                    <div class="desc">
                        <div class="detail"><i>${i.book_name}</i>
                        </div>
                    </div>
                </div>
            </div>
            </a>
        </c:forEach>

    </div>

    <!--<div class="right_evaluate">-->
    <div class="tab">
        <div id="box">
            <!--这个ul为选项卡的菜单，提供选择项，并且设置其中一个li为默认样式-->
            <ul>
                <li class="active">目录</li>
                <li>评论</li>
            </ul>
            <!--这个div为选项卡的内容，显示不同菜单的不同内容，并且设置其中一个div为可见，其他隐藏-->
            <div id="content">
                <div style="display: block;">
                    <h2 style="font-size: 20px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px; text-align: center">
                        目录</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第一回：宴桃园豪杰三结义 斩黄巾英雄首立功</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第二回：张翼德怒鞭督邮 何国舅谋诛宦竖</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第三回：议温明董卓叱丁原 馈金珠李肃说吕布</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第四回：废汉帝陈留践位 谋董贼孟德献刀</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第五回：发矫诏诸镇应曹公 破关兵三英战吕布</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第六回：焚金阙董卓行凶 匿玉玺孙坚背约</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第七回：袁绍磐河战公孙 孙坚跨江击刘表</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第八回：王司徒巧使连环计 董太师大闹凤仪亭</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第九回：除凶暴吕布助司徒 犯长安李?听贾诩</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第十回：勤王室马腾举义 报父仇曹操兴师</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第十一回：刘皇叔北海救孔融 吕温侯濮阳破曹操</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第十二回：陶恭祖三让徐州 曹孟德大战吕布</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第十三回：李?郭汜大交兵 杨奉董承双救驾</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第十四回：曹孟德移驾幸许都 吕奉先乘夜袭徐郡</h2>
                    <h2 style="font-size: 16px;margin: 15px 10px; border-bottom: 1px dashed #CCCCCC; height: 30px">
                        第十五回：太史慈酣斗小霸王 孙伯符大战严白虎</h2>
                    <!--<img src="<%=basePath%>jsp/shop/img/emptyImage.png" style="width: 870px;height:800px;position: absolute;margin-top: -90px;">-->
                </div>

                <div>
                    <img src="<%=basePath%>jsp/images/timg.jpg"
                         style="width: 50px;height:50px;border-radius:50px;margin: 10px 10px;">
                    <h2 style="font-size: 16px;margin: -35px 70px; border-bottom: 1px dashed #CCCCCC;height: 50px">
                        客观说一下，我是不爱读书的人这本书下午2：00钟开始看看到3：30看了一半了，是真心好看。用举例和图画来讲很容易就懂了。</h2></br></br>
                    <img src="<%=basePath%>jsp/images/timg(1).jpg"
                         style="width: 50px;height:50px;border-radius:50px;margin: 10px 10px;">
                    <h2 style="font-size: 16px;margin: -35px 70px; border-bottom: 1px dashed #CCCCCC;height: 50px">
                        震惊。。总的来说，书本有损坏，对爱看书喜欢收藏书的人来说是一件很不爽的事情，望改正。。。。</h2></br></br>
                    <img src="<%=basePath%>jsp/images/timg(2).jpg"
                         style="width: 50px;height:50px;border-radius:50px;margin: 10px 10px;">
                    <h2 style="font-size: 16px;margin: -35px 70px; border-bottom: 1px dashed #CCCCCC;height: 50px">
                        书的内容看着一般吧呵呵😄，我们的生活方式的不同的方式不同的是的不同的地方就是说我的生活方式不同的时候我就不知道了。</h2></br></br>
                    <img src="<%=basePath%>jsp/images/timg(3).jpg"
                         style="width: 50px;height:50px;border-radius:50px;margin: 10px 10px;">
                    <h2 style="font-size: 16px;margin: -35px 70px; border-bottom: 1px dashed #CCCCCC;height: 50px">
                        最近没什么好看的书 朋友推荐了这个 看着不错 回去慢慢看</h2></br></br>
                    <img src="<%=basePath%>jsp/images/toux.jpg"
                         style="width: 50px;height:50px;border-radius:50px;margin: 10px 10px;">
                    <h2 style="font-size: 16px;margin: -35px 70px; border-bottom: 1px dashed #CCCCCC;height: 50px">
                        好好说话，情商的高低取决于你说话好听的程度</h2></br></br>
                    <img src="<%=basePath%>jsp/images/timg(4).jpg"
                         style="width: 50px;height:50px;border-radius:50px;margin: 10px 10px;">
                    <h2 style="font-size: 16px;margin: -35px 70px; border-bottom: 1px dashed #CCCCCC;height: 50px">
                        还是惊喜的，不过我不好评价，毕竟还没看呢，起初是因为班上要捐书，我刚过来，没啥子课外书</h2></br></br>
                    <img src="<%=basePath%>jsp/images/timg(5).jpg"
                         style="width: 50px;height:50px;border-radius:50px;margin: 10px 10px;">
                    <h2 style="font-size: 16px;margin: -35px 70px; border-bottom: 1px dashed #CCCCCC;height: 50px">
                        可以可以，很强势。已经读了一本，感觉还不错。继续努力</h2></br></br>


                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript">
        window.onload = function () {
            var oBox = document.getElementById('box');
            var aLi = oBox.getElementsByTagName('li');
            var oCon = document.getElementById('content');
            var aDiv = oCon.getElementsByTagName('div');

            for (var i = 0; i < aLi.length; i++) {
                aLi[i].index = i;   //为每个li添加对应的索引index
                aLi[i].onclick = function () {   //循环为每个li添加onclick事件
                    for (var i = 0; i < aLi.length; i++) {
                        aLi[i].className = '';  //循环清空li样式
                        aDiv[i].style.display = 'none';  //循环隐藏所有div
                    }
                    this.className = 'active';  //当前点击的元素样式变成active
                    aDiv[this.index].style.display = 'block';    //this.index 获取当前li对应的索引
                }
            }
        }
    </script>
    <script src="../js/details.js"></script>


</div>
</body>
</html>
