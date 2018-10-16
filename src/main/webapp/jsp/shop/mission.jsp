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
</head>
<body>
<div class="main">

    <div class="main-left">
        <div class="col-xs-3">
            <div class="service-bg">
                <a href="/?q=node/11">
                    <div class="col-xs-6 service-box service-box1">
                        <div class="service-pic">
                            <img src="img/tb1.png" width="50%" height="50%" alt=""/>
                        </div>
                        <div class="service-name">开放时间</div>
                    </div>
                </a>
                <div class="service-bg">
                    <a href="/?q=node/13">
                        <div class="col-xs-6 service-box service-box2">
                            <div class="service-pic">
                                <img src="img/tb2.png" width="50%" height="50%" alt=""/>
                            </div>
                            <div class="service-name">借阅服务</div>
                        </div>
                    </a>
                    <a href="/?q=node/18">
                        <div class="col-xs-6 service-box service-box3">
                            <div class="service-pic">
                                <img src="img/tb3.png" width="50%" height="50%" alt=""/>
                            </div>
                            <div class="service-name">续借/预约</div>
                        </div>
                    </a>
                    <a href="/?q=node/14">
                        <div class="col-xs-6 service-box service-box4">
                            <div class="service-pic">
                                <img src="img/tb4.png" width="50%" height="50%" alt=""/>
                            </div>
                            <div class="service-name">外借规则</div>
                        </div>
                    </a>
                    <a href="/?q=node/12">
                        <div class="col-xs-6 service-box service-box5">
                            <div class="service-pic">
                                <img src="img/tb5.png" width="50%" height="50%" alt=""/>
                            </div>
                            <div class="service-name">图书捐赠</div>
                        </div>
                    </a>
                    <a href="/?q=node/22">
                        <div class="col-xs-6 service-box service-box6">
                            <div class="service-pic">
                                <img src="img/tb6.png" width="50%" height="50%" alt=""/>
                            </div>
                            <div class="service-name">电子报刊</div>
                        </div>
                    </a>
                    <a href="/?q=node/24">
                        <div class="col-xs-6 service-box service-box7">
                            <div class="service-pic">
                                <img src="img/tb7.png" width="50%" height="50%" alt=""/>
                            </div>
                            <div class="service-name">媒体报道</div>
                        </div>
                    </a>
                    <a href="/?q=node/23">
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
    <div class="main-right">
        <div class="maer-right">
            <img src="img/tsg.jpg" />
            <div class="t_notice1">
                <ul id="dayTask">
                    <li>价格很高</li>
                    <li>价格很高</li>
                </ul>
            </div>
            <div class="t_notice2">
                <ul id="growTask">
                    <li>哈哈哈哈</li>
                    <li>哈哈哈哈</li>
                </ul>
                <div class="col-xs-12 information-nav-bg">
                    <div class="col-xs-1 information information-nav">重图动态</div>
                    <div class="col-xs-1 information middle-nav">业界动态</div>
                </div>

            </div>
        </div>
    </div>
</div>

<script src="<%=basePath%>jsp/shop/js/jquery-1.12.4.js"></script>
<script src="<%=basePath%>jsp/shop/js/mission.js"></script>
</body>
</html>
