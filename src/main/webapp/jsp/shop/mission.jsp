<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/8 0008
  Time: 下午 5:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <a href="#">
                        <div class="col-xs-6 service-box service-box2">
                            <div class="service-pic">
                                <img src="img/tb2.png" width="50%" height="50%" alt=""/>
                            </div>
                            <div class="service-name">借阅服务</div>
                        </div>
                    </a>
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
        <img src="img/tsg.jpg" />



        <div class="nTab">
            <div class="TabContent">
                <div id="myTab_Content0" style="height:500px;overflow:hidden;">
                    <ul class="disc" style="height:250%;">
                        <li id="hdemo1"><a href="#">●lcvc图书馆皮书数字资源中标结果公示</a></li>
                        <li id="hdemo2"><a href="#">●lcvc图书馆报告厅舞台新增升降灯架设备中标公告</a></li>
                        <li id="hdemo3"><a href="#">●lcvc图书馆连环画数字资源流标公告</a></li>
                        <li id="hdemo4"><a href="#">●lcvc图书馆统一资源检索数字资源中标结果公示</a></li>
                        <li id="hdemo5"><a href="#">●lcvc图书馆外语教学数字资源中标结果公示</a></li>
                        <li id="hdemo6"><a href="#">●lcvc图书馆硕士论文数字资源中标结果公示</a></li>
                        <li id="hdemo7"><a href="#">●lcvc图书馆少儿期刊数字资源中标结果公示</a></li>
                        <li id="hdemo8"><a href="#">●刘天高板改造及车库围护桩施工监理采购流标公告</a></li>
                        <li id="hdemo9"><a href="#">●lcvc图书馆2018年考核招聘专业技术人员拟聘公示</a></li>
                        <li id="hdemo10"><a href="#">●lcvc图书馆统一资源检索数字资源 询价采购公告</a></li>
                        <li id="hdemo11"><a href="#">●lcvc图书馆连环画数字资源 询价采购公告</a></li>
                        <li id="hdemo12"><a href="#">●lcvc图书馆皮书数字资源 询价采购公告</a></li>
                        <li id="hdemo13"><a href="#">●lcvc图书馆少儿期刊数字资源 询价采购公告</a></li>
                        <li id="hdemo14"><a href="#">●lcvc图书馆硕士论文数字资源 询价采购公告</a></li>
                        <li id="hdemo15"><a href="#">●lcvc图书馆外语教学数字资源 询价采购公告</a></li>
                        <li id="hdemo16"><a href="#">●lcvc图书馆报告厅舞台新增升降灯架设备采购公告</a></li>
                        <li id="hdemo17"><a href="#">●关于开展2018年10月“书记馆长接待日”活动的通知</a></li>
                        <li id="hdemo18"><a href="#">●刘天高板改造及车库围护桩施工监理采购项目</a></li>
                    </ul>
                </div>
                <div id="myTab_Content1" class="none" style="height:500px;overflow:hidden;">
                    <ul class="disc" style="height:250%;">
                    <li  id="hdemo19"><a href="#">【好书推荐】以文发声，以声扬情——那些被心诵图书</a></li>
                    <li  id="hdemo20"><a href="#">【活动报道】“常青e路 幸福夕阳”数字阅读培训活动</a></li>
                    <li id="hdemo21"><a href="#">【活动预告】“阅读之星”——民诵读大赛市级复赛</a></li>
                    <li id="hdemo22"><a href="#">【通知公告】lcvc图书馆2018年考核招聘专业技术人员</a></li>
                    <li id="hdemo23"><a href="#">【活动预告】书友会——鸣家·鸣声·为文字发声</a></li>
                    <li id="hdemo24"><a href="#">【通知公告】关于开展2018年10月“书记馆长接待日”</a></li>
                    <li id="hdemo25"><a href="#">【期刊推荐】2018年9月期刊推荐 欢迎读者到馆阅览</a></li>
                    <li id="hdemo26"><a href="#">【活动报道】作家赵美萍读者俱乐部“书友会”感悟</a></li>
                    <li id="hdemo27"><a href="#">【活动报道】国粹传承，为爱而行——图书馆笔礼</a></li>
                    <li id="hdemo28"><a href="#">【活动预告】图书馆举办“庆国庆·讴歌改革开放40周年”活动</a></li>
                    <li id="hdemo29"><a href="#">【活动预告】图书馆开展“文化帮扶 送书下乡”活动</a></li>
                    <li id="hdemo30"><a href="#">【通知公告】书香渝北再添彩：图书馆新建两个阅读点</a></li>
                    <li id="hdemo31"><a href="#">【活动报道】举办2018年“少年儿童爱心图书接力服务”活动</a></li>
                    <li id="hdemo32"><a href="#">【期刊推荐】图书馆开展“读山水·看万盛”诗文诵读会</a></li>
                    <li id="hdemo33"><a href="#">【期刊推荐】涪陵区图书馆举办中秋节图片展</a></li>
                    <li id="hdemo34"><a href="#">【活动报道】“向上的力量·共绘魅力九龙坡”借阅活动</a></li>
                    <li id="hdemo35"><a href="#">【期刊推荐】依法登记成立的图书馆，支持各类图书馆</a></li>
                    <li id="hdemo36"><a href="#">【通知公告】为政府提供公益性服务的重大文化项目</a></li>

                    </ul>
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
        </div>
    </div>
</div>

<script type="text/javascript">
    speed = 100; //数字越大滚得越慢
    var htab = document.getElementById("myTab_Content1");
    var htab19 = document.getElementById("hdemo19");
    var htab36= document.getElementById("hdemo36");

    htab36.innerHTML = htab19.innerHTML;
    htab.scrollTop = htab19.offsetHeight;

    function Marquee() {
        if(htab.scrollTop >= htab19.offsetHeight) {
            htab.scrollTop -= htab36.offsetHeight;
        } else {
            htab.scrollTop += 1;
        }
    }
    var MyMar = setInterval(Marquee, speed);
</script>
<script src="<%=basePath%>jsp/shop/js/jquery-1.12.4.js"></script>
<script src="<%=basePath%>jsp/shop/js/mission.js"></script>
</body>
</html>
