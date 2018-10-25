<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/8 0008
  Time: 下午 5:14
  To change this template use File | Settings | File Templates
--%>
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
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/mission.css" />
    <script type="text/javascript">
        function nTabs(thisObj,Num){
            if(thisObj.className == "active")return;
            var tabObj = thisObj.parentNode.id;
            var tabList = document.getElementById(tabObj).getElementsByTagName("li");
            for(i=0; i <tabList.length; i++)
            {
                if (i == Num)
                {
                    thisObj.className = "active";
                    document.getElementById(tabObj+"_Content"+i).style.display = "block";
                }else{
                    tabList[i].className = "normal";
                    document.getElementById(tabObj+"_Content"+i).style.display = "none";
                }
            }
        }
    </script>
</head>
<body>
<div class="main">
    <div class="main-left">
        <div class="col-xs-3">
            <div class="service-bg">
                <a href="">
                    <div class="col-xs-6 service-box service-box1">
                        <div class="service-pic">
                            <img src="img/tb1.png" width="50%" height="50%" alt=""/>
                        </div>
                        <div class="service-name">开放时间</div>
                    </div>
                </a>
                <div class="service-bg">


                        <c:choose>
                            <c:when test="${sessionScope.admin!=null}">


                                <a href="<%=basePath%>admin/ToIndex" target="_top">
                                    <div class="col-xs-6 service-box service-box2">
                                        <div class="service-pic">
                                            <img src="img/Admin_mesage.png" width="50%" height="50%" alt=""/>
                                        </div>
                                        <div class="service-name">进入后台管理</div>
                                    </div>
                                </a>


                            </c:when>
                            <c:otherwise>
                            <a href="">
                                <div class="col-xs-6 service-box service-box2">
                                    <div class="service-pic">
                                        <img src="img/tb2.png" width="50%" height="50%" alt=""/>
                                    </div>
                                    <div class="service-name">借阅服务</div>
                                </div>
                            </a>


                            </c:otherwise>




                        </c:choose>



                    <a href="">
                        <div class="col-xs-6 service-box service-box3">
                            <div class="service-pic">
                                <img src="img/tb3.png" width="50%" height="50%" alt=""/>
                            </div>
                            <div class="service-name">续借/预约</div>
                        </div>
                    </a>
                    <a href="">
                        <div class="col-xs-6 service-box service-box4">
                            <div class="service-pic">
                                <img src="img/tb4.png" width="50%" height="50%" alt=""/>
                            </div>
                            <div class="service-name">外借规则</div>
                        </div>
                    </a>
                    <a href="">
                        <div class="col-xs-6 service-box service-box5">
                            <div class="service-pic">
                                <img src="img/tb5.png" width="50%" height="50%" alt=""/>
                            </div>
                            <div class="service-name">图书捐赠</div>
                        </div>
                    </a>
                    <a href="">
                        <div class="col-xs-6 service-box service-box6">
                            <div class="service-pic">
                                <img src="img/tb6.png" width="50%" height="50%" alt=""/>
                            </div>
                            <div class="service-name">电子报刊</div>
                        </div>
                    </a>
                    <a href="">
                        <div class="col-xs-6 service-box service-box7">
                            <div class="service-pic">
                                <img src="img/tb7.png" width="50%" height="50%" alt=""/>
                            </div>
                            <div class="service-name">媒体报道</div>
                        </div>
                    </a>
                    <a href="">
                        <div class="col-xs-6 service-box service-box8">
                            <div class="service-pic">
                                <img src="img/tb8.png" width="100%" height="100%" alt=""/>
                            </div>
                            <div class="service-name">参观来访</div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

    </div>
    <!--右边大边框-->
    <div class="maer-right">
        <div class="container">
            <img class='photo'  src="img/tsg.jpg" alt=""/>
            <img class='photo'  src="img/tsg.jpg" alt=""/>
            <img class='photo'  src="img/tsg1.jpg" alt="" />
            <img class='photo'  src="img/tsg2.jpg" alt="" />
            <img class='photo'  src="img/tsg3.jpg" alt="" />
        </div>
        <div class="nTab">
            <div class="TabContent">
                <div id="myTab_Content0">
                    <div id="demo" style="overflow:hidden;height:420px;width:470px;margin-left:-5px; margin-top:5px;">
                        <div id="demo1">
                            <a href="#">●lcvc图书馆连环画数字资源 询价采购公告</a>
                            <a href="#">●lcvc图书馆就业数字资源 询价采购公告</a>
                            <a href="#">●lcvc图书馆博士论文数字资源 询价采购公告</a>
                            <a href="#">●lcvc图书馆绘本数字资源 询价采购公告</a>
                            <a href="#">●lcvc图书馆学术期刊数字资源 询价采购公告</a>
                            <a href="#">●数字图书馆推广工程2018年度数字资源联合建设采购公告</a>
                            <a href="#">●数字图书馆推广工程2018年度数字资源联合建设招标公告</a>
                            <a href="#">●数字图书馆推广工程2018年度数字资源联合建设招标公告</a>
                            <a href="#">●lcvc图书馆皮书数字资源中标结果公示</a>
                            <a href="#">●lcvc图书馆报告厅舞台新增升降灯架设备中标公告</a>
                        </div>
                        <div id="demo2"></div>
                        <a href="#">●lcvc图书馆连环画数字资源流标公告</a>
                        <a href="#">●lcvc图书馆统一资源检索数字资源中标结果公示</a>
                        <a href="#">●lcvc图书馆外语教学数字资源中标结果公示</a>
                        <a href="#">●lcvc图书馆绘本数字资源 询价采购公告</a>
                        <a href="#">●lcvc图书馆学术期刊数字资源 询价采购公告</a>
                        <a href="#">●数字图书馆推广工程2018年度数字资源联合建设采购公告</a>
                        <a href="#">●数字图书馆推广工程2018年度数字资源联合建设招标公告</a>
                        <a href="#">●数字图书馆推广工程2018年度数字资源联合建设招标公告</a>
                        <a href="#">●lcvc图书馆皮书数字资源中标结果公示</a>
                        <a href="#">●lcvc图书馆报告厅舞台新增升降灯架设备中标公告</a>
                        </div>
                </div>
                <div id="myTab_Content1" class="none">
                    <div id="demoe" style="overflow:hidden;height:420px;width:470px;margin-left:-5px; margin-top:5px;">
                        <div id="demo11">
                            <a href="#">【活动报道】新闻主播做客“书友会”分享朗读技巧</a>
                            <a href="#">【好书推荐】以文发声，以声扬情——那些被口唱心诵的图书</a>
                            <a href="#">【活动报道】“常青e路 幸福夕阳”老年人数字阅读培训特别活动</a>
                            <a href="#">【活动预告】“阅读之星”——民诵读大赛市级机关片区复赛</a>
                            <a href="#">【通知公告】lcvc图书馆2018年考核招聘专业技术人员拟聘公示</a>
                            <a href="#">【活动预告】书友会——鸣家·鸣声·为文字发声（10月20日）</a>
                            <a href="#">【通知公告】关于开展“书记馆长接待日”活动的通知</a>
                            <a href="#">【期刊推荐】2018年9月期刊推荐 欢迎读者阅览</a>
                            <a href="#">【期刊推荐】国粹传承，为爱而行——图书馆开笔礼</a>
                            <a href="#">【活动预告】lcvc图书馆举办“庆国庆·讴歌改革开放40周年”</a>
                        </div>
                        <div id="demo22"></div>
                        <a href="#">【活动预告】图书馆开展“文化帮扶 送书下乡”活动</a>
                        <a href="#">【通知公告】书香渝北再添彩：图书馆新建两个阅读点</a>
                        <a href="#">【活动报道】举办2018年“少年儿童爱心图书接力服务”活动</a>
                        <a href="#">【期刊推荐】图书馆开展“读山水·看万盛”诗文诵读会</a>
                        <a href="#">【期刊推荐】涪陵区图书馆举办中秋节图片展</a>
                        <a href="#">【活动报道】“向上的力量·共绘魅力九龙坡”借阅活动</a>
                        <a href="#">【期刊推荐】依法登记成立的图书馆，支持各类图书馆</a>
                        <a href="#">【通知公告】为政府提供公益性服务的重大文化项目</a>
                        <a href="#">【期刊推荐】lcvc图书馆文献联合编目中心</a>
                        <a href="#">【通知公告】lcvc图书馆借阅书籍公告</a>
                    </div>
                </div>

            </div>
            <div class="TabTitle">
                <ul id="myTab">
                    <li class="active" onmouseover="nTabs(this,0);">重图动态</li>
                    <li class="normal" onmouseover="nTabs(this,1);">业界动态</li>
                </ul>
            </div>

        </div>

    </div>

            </div>

<!-- 文字滚动1-->
<script>
    //文字移动速度
    var speed=30
    var demo=document.getElementById("demo");
    var demo2=document.getElementById("demo2");
    var demo1=document.getElementById("demo1");
    demo2.innerHTML=demo1.innerHTML
    function Marquee(){
        if(demo2.offsetTop-demo.scrollTop<=0)
            demo.scrollTop-=demo1.offsetHeight
        else{
            demo.scrollTop++
        }
    }
    var MyMar=setInterval(Marquee,speed)
    demo.onmouseover=function() {clearInterval(MyMar)}
    demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
</script>

<!-- 文字滚动2-->
<script>
    var speed=30
    var demoe=document.getElementById("demoe");
    var demo22=document.getElementById("demo22");
    var demo11=document.getElementById("demo11");
    demo22.innerHTML=demo11.innerHTML
    function Marquee(){
        if(demo22.offsetTop-demoe.scrollTop<=0)
            demoe.scrollTop-=demo11.offsetHeight
        else{
            demoe.scrollTop++
        }
    }
    var MyMar=setInterval(Marquee,speed)
    demoe.onmouseover=function() {clearInterval(MyMar)}
    demoe.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
</script>
<script src="<%=basePath%>jsp/shop/js/prefixfree.min.js"></script>
<script src="<%=basePath%>jsp/shop/js/jquery-1.12.4.js"></script>
<script src="<%=basePath%>jsp/shop/js/mission.js"></script>
</body>
</html>
