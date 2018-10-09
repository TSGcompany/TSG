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


    <script src="<%=basePath%>jsp/shop/js/main.js"></script>
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

    <div class="ts_cones">
        <div class="topit1">
            <h3>热门推荐</h3>
            <img src="img/rd1.png"/>
        </div>
        <div class="topit2">
            <h3>图书推荐</h3>
            <img src="img/rd2.png"/>
        </div>
        <div class="topit3">
            <h3>阅读荐书</h3>
            <img src="img/rd3.png"/>
        </div>
        <div class="tsg_input">
            <select id="u_input">
                <option selected value="请选择图书分类">请选择图书分类</option>
                <option value="青春文学">青春文学</option>
                <option value="小说">小说</option>
                <option value="励志与成功">励志与成功</option>
                <option value="心理学">心理学</option>
                <option value="科学与自然">科学与自然</option>
                <option value="历史">历史</option>
                <option value="社会科学">社会科学</option>
            </select>

            <div id="tsg_mane">
                <input type="text" name="search" placeholder="请输入关键字">
                <div id="search">搜索</div>
            </div>
        </div>
    </div>



    <!--图书展示大框-->
    <div class="tsg_classify">
        <!--书本灰色边框 -->
        <div id="tsg_among">
            <img src="img/ts1.jpg" />
            <h4>俞敏洪</h4>
            <p>《愿你的青春不负梦想》</p>
            <!--五星评分-->
            <ul class="comment">
                <li>☆</li>
                <li>☆</li>
                <li>☆</li>
                <li>☆</li>
                <li>☆</li>
            </ul>
            <div class="borrow">
                <h2 class="card-title tsg_Name">借阅</h2>
            </div>
            <div class="subscribe">
                <h2 class="card-title tsg_Name">预约</h2>
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
