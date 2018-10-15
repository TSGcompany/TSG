<%--
  Created by IntelliJ IDEA.
  User: A N L E
  Date: 2018/10/8 0008
  Time: 下午 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>图书馆借阅系统</title>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/middle.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>jsp/shop/css/main.css">
</head>
<!--
作者：offline
时间：2018-09-19
描述：整个
-->
<div class="middle">
    <!--
作者：offline
时间：2018-09-19
描述：上面
-->
<!--图书展示大框-->
    <div class="tsg_classify">
        <!--书本灰色边框 -->
        <div id="tsg_among">
            <img src="img/ts1.jpg" />
            <h4>俞敏洪</h4>
            <p>《愿你的青春不负梦想》</p>
            <!--五星评分-->
            <ul class="comment">
                <li>★</li>
                <li>★</li>
                <li>★</li>
                <li>★</li>
                <li>★</li>
            </ul>

            <div id="borrow">
                <a href="#">借阅</a>
            </div>

            <div id="make">
            <a href="#"> 预约</a>
            </div>

        </div>



        <!--
        作者：offline
        时间：2018-09-20
        描述：分页
    -->
        <div class="page_container center">
            <div class="page_btn prev_page left">上一页</div>
            <div class="page_num_container left" id="page_num_container">
                <ul>
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>6</li>
                    <li>7</li>
                    <li>8</li>
                    <li>9</li>
                    <li>10</li>
                    <li>11</li>
                    <li>12</li>
                    <li>13</li>
                    <li>14</li>
                    <li>15</li>
                    <li>16</li>
                    <li>17</li>
                    <li>18</li>
                    <li>19</li>
                    <li>20</li>
                    <li>21</li>
                </ul>
            </div>
            <div class="page_btn next_page left">下一页</div>
            <div class="page_btn all_page right">共21页</div>


        </div>
    </div>





</div>

<script src="<%=basePath%>jsp/shop/js/jquery-1.11.0.js"></script>
<script src="<%=basePath%>jsp/shop/js/index.js"></script>
</body>
</html>
