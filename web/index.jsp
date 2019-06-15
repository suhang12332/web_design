<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="bean.User" %>
<%@ page import="dao.PostDaoImpl" %>
<%@ page import="bean.Post" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>论坛</title>
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <script src="assets/js/ie-emulation-modes-warning.js"></script>
    <link href="css/carousel.css" rel="stylesheet">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="layui/css/modules/layer/default/layer1.css">
    <style>
        .searchinput {
            border-radius: 20px;
            border: 1.5px solid;
            border-color: transparent;
            outline: none;
            transition: border-color 1s;
        }

        .searchinput:hover {
            border-color: #00b4ef;
        }

        .username {
            color: #9d9d9d;
            transition: color 1s;
        }

        .username:hover {
            color: #ffffff;
        }

        .title {
            position: static;
            margin-left: 50px;
            background: transparent;
            padding: 12px 12px;
        }

        .modal-backdrop {
            z-index: 0;
        }

        .photo {
            float: left;
            padding: 12px 12px;
        }
    </style>
</head>
<body>
<div class="navbar-wrapper">
    <div class="container" style="width: 100%;position:fixed;">
        <nav class="navbar navbar-inverse navbar-static-top" style="border-radius: 0px">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                            aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <c:if test="${sessionScope.user==null}">
                        <a class="navbar-brand" href="#">未来论坛</a>
                    </c:if>
                    <c:if test="${sessionScope.user!=null}">
                    <li>
                        <div class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                             aria-expanded="false" style="float: left;">
                            <div class="col-md-12 column" style="margin-top: 10px;margin-bottom: 10px;">
                                <c:if test="${sessionScope.user.userImg==null}">
                                    <img suhang="aaa" src="image/timg.jpeg" height="30px" width="30px" class="img-circle"/>
                                </c:if>
                                <c:if test="${sessionScope.user.userImg!=null}">
                                    <img src="image/${sessionScope.user.userImg}" height="30px" width="30px"
                                         class="img-circle"/>
                                </c:if>
                                <span class="username">${sessionScope.user.userName}<span class="caret"></span></span>
                            </div>
                        </div>
                        <ul class="dropdown-menu"style="margin-top: 0px">
                            <li><a href="#">性 别:
<%--                                                                    <%--%>
<%--                                                                        Object user1 = request.getSession().getAttribute("user");//得到用户信息的toString()串--%>
<%--                                                                        String userjson = JSONObject.toJSONString(user1);//将toString()转为json串--%>
<%--                                                                        User user = JSON.parseObject(userjson, User.class);//将json串转为对象,方便获取对象中的数值--%>
<%--                                                                        if(user.getUserSex().equals("男")){%>--%>
<%--                                                                    <i class="fas fa-mars" style="color:#00b4ef"></i>--%>
<%--                                                                        <%}else {%>--%>
<%--                                                                    <i class="fas fa-venus" style="color:#ce8483"></i>--%>
<%--                                                                        <%}%>--%>
                                    ${sessionScope.user.userSex=="男"?"<i class=\"fas fa-mars\" style=\"color:#00b4ef\"></i>":"<i class=\"fas fa-venus\" style=\"color:#d44950\"></i>"} <%--括号中的双引号，需使用转义--%>
<%--                                                                </a></li>--%>
<%--                            <c:if test="${sessionScope.user.userSex}">--%>
<%--                                <i class="fas fa-mars" style="color:#00b4ef"></i>--%>
<%--                                </c:if>--%>
<%--                            <c:if test="${sessionScope.user.userSex=="女"}">--%>
<%--                                <i class="fas fa-venus" style="color:#00b4ef"></i>--%>
<%--                                </c:if>--%>
                            <li><a href="#">生日:
                                <c:if test="${sessionScope.user.userBirthday==null}">
                                    用户好懒, 没有个性签名
                                </c:if>
                                <c:if test="${sessionScope.user.userBirthday!=null}">
                                    ${sessionScope.user.userBirthday}
                                </c:if>
                            </a></li>
                            <li><a href="#">个性签名:
                                <c:if test="${sessionScope.user.userSate==null}">
                                    用户好懒, 没有个性签名
                                </c:if>
                                <c:if test="${sessionScope.user.userSate!=null}">
                                    ${sessionScope.user.userSate}
                                </c:if>
                            </a></li>
                            <li><a href="userinformation.jsp">更改部分信息</a></li>
                            <li><a onclick="window.location.href='userInPostServlet?${sessionScope.user.userName}'">查看用户信息</a></li>
                            <li><a href="SignoutServlet"><i class="fas fa-sign-out-alt"></i>注销当前用户</a></li>
                        </ul>
                        </c:if>
                    </li>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav" style="float: none;">
                        <li><a href="welcomeServlet"><span><i class="fas fa-home home"></i></span> 主页</a></li>
                        <c:if test="${sessionScope.user == null}">  <%--判断登录前的session中的user对象是否为空,为空表示当前没有登录--%>
                            <li><a href="login.jsp"><span><i class="fas fa-user home"></i></span> 登录</a></li>
                        </c:if>
                        <c:if test="${sessionScope.user != null}">
                            <li><a href="newpost.jsp"><span><i class="fas fa-edit home"></i></span> 发帖</a></li>
                        </c:if>
                        <li style="float: right;">
                            <div class="container-fluid">
                                <div class="row-fluid">
                                    <div class="span12">
                                        <form class="form-search" style="margin-bottom: 0px;margin-top: 12px;">
                                            <input class="input-medium search-query searchinput" type="text" style="text-align: center" name="search">
                                            <button type="submit" class="btn btn-sm" style="outline: none; " formaction="searchServlet">查找</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img class="first-slide"
                 src="image/javaa.png"
                 alt="First slide" onclick="window.location.href='PlateInformationServlet?Java'">
            <div class="container" >
                <div class="carousel-caption" >
                    <p>Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。
                        Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程</p>
                    <p><button onclick="window.location.href='PlateInformationServlet?Java'" style="background: transparent;border-color: transparent;outline: transparent">进入板块</button></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="second-slide"
                 src="./image/mysqll.png"
                 alt="Second slide" onclick="window.location.href='PlateInformationServlet?Mysql'">
            <div class="container" >
                <div class="carousel-caption" >
                    <p>MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，目前属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，
                        在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件之一。</p>
                    <p><button  onclick="window.location.href='PlateInformationServlet?Mysql'"  style="background: transparent;border-color: transparent;outline: transparent">进入版块</button></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="third-slide"
                 src="image/htmll.png"
                 alt="Third slide" onclick="window.location.href='PlateInformationServlet?HtmlCss'">
            <div class="container" >
                <div class="carousel-caption" >
                    <p>超文本标记语言(Hyper Text Markup Language)，标准通用标记语言下的一个应用。
                        HTML 不是一种编程语言，而是一种标记语言 (markup language)，是网页制作所必备的</p>
                    <p><button onclick="window.location.href='PlateInformationServlet?HtmlCss'" style="background: transparent;border-color: transparent;outline: transparent">进入版块</button></p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div class="container marketing">
    <div class="row">
        <div class="col-lg-4">
            <img class="img-circle"
                 src="image/java.png"
                 alt="Generic placeholder image" width="140" height="140">
            <h2>Java</h2>
            <p>Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。
                Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程</p>
            <p><a class="btn btn-default" onclick="window.location.href='PlateInformationServlet?Java'" role="button">进入该版块 &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <img class="img-circle"
                 src="image/mysql.png"
                 alt="Generic placeholder image" width="140" height="140">
            <h2>Mysql</h2>
            <p>MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，目前属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，
                在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件之一。</p>
            <p><a class="btn btn-default" onclick="window.location.href='PlateInformationServlet?Mysql'" role="button">进入该版块 &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <img class="img-circle"
                 src="image/html.png"
                 alt="Generic placeholder image" width="140" height="140">
            <h2>Html</h2>
            <p>超文本标记语言(Hyper Text Markup Language)，标准通用标记语言下的一个应用。
                HTML 不是一种编程语言，而是一种标记语言 (markup language)，是网页制作所必备的</p>
            <p><a class="btn btn-default" onclick="window.location.href='PlateInformationServlet?HtmlCss'" role="button">进入该版块 &raquo;</a></p>
        </div>
    </div>
    <hr class="featurette-divider" style="margin: 20px 0;background-color: transparent;">
    <div class="col-md-12 column" style="text-align: center">
        <h4>
            本页一共有${requestScope.allPost.size()}篇帖子
        </h4>
        <br><br>
    </div>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <c:forEach items="${requestScope.allPost}" begin="0" end="${requestScope.allPost.size()}" varStatus="status">
                    <table class="table table-condensed table-hover" onclick="window.location.href='postInformationServlet?${requestScope.allPost[status.index].postId}'">
                        <tbody>
                        <tr>
                            <th style="border-top: 0px solid transparent; background: rgba(0,0,0,0.05); border-radius: 10px">
                                <div class="photo"><img src="image/${requestScope.allPost[status.index].userImg}" height="40" width="40" class="img-rounded"></div>
                                <div class="title">${requestScope.allPost[status.index].postTitle}
                                    <div>
                                        <a href="userInPostServlet?${requestScope.allPost[status.index].userName}" class="aherf">${requestScope.allPost[status.index].userName}</a>
                                        <span class="">|</span>
                                        <a href="postInformationServlet?${requestScope.allPost[status.index].postId}" class="aherf">${requestScope.allPost[status.index].postTime}</a>
                                    </div>
                                </div>
                            </th>
                        </tr>
                    </table>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="col-md-12 column">
        <center>
            <div class="pagination">
                <c:if test="${requestScope.start<10}">
                    <li>
                    </li>
                </c:if>
                <c:if test="${requestScope.start>=10}">
                    <li>
                        <a href="PageCurrentServlet?${requestScope.start}&0">上一页</a>
                    </li>
                </c:if>
                <c:if test="${requestScope.allPost1.size()-requestScope.start<10}">
                    <li>
                    </li>
                </c:if>
                <c:if test="${requestScope.allPost1.size()-requestScope.start>=10}">
                    <li>
                        <a href="PageCurrentServlet?${requestScope.start}&1">下一页</a>
                    </li>
                </c:if>
            </div>
        </center>
    </div>
    <footer>
        <p style="text-align: center"><a href="#" >Back to top</a></p>
        <br>
    </footer>
</div>
<div class="container" style="padding:0 0; width: 100%">
    <nav class="navbar navbar-inverse navbar-static-top" style="margin-bottom: 0px; background: #222222; height: 80px">
        <div class="container">
            <div class="navbar-header">
            </div>
            <div id="navbar1" class="navbar-collapse collapse">
            </div>
        </div>
        <br>
        <center style="color: whitesmoke"><i class="fas fa-share" style="color: whitesmoke"></i>&nbsp;&nbsp;<i class="fab fa-weixin"></i>&nbsp;&nbsp;
            <i class="fab fa-qq"></i>&nbsp;&nbsp;<i class="fab fa-facebook"></i>&nbsp;&nbsp;
            <i class="fab fa-skype"></i>&nbsp;&nbsp;<i class="fab fa-weibo"></i>&nbsp;&nbsp;
            <i class="fab fa-twitter"></i>&nbsp;&nbsp;<i class="fab fa-instagram"></i>
        </center><br>
        <p style="color:whitesmoke;text-align: center">Designed by <a href="#" style="color: whitesmoke">@su</a></p>
    </nav>
</div>
<script src="dist/js/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="dist/js/bootstrap.min.js"></script>
<script src="assets/js/vendor/holder.min.js"></script>
<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
<script src="layui/layui.js"></script>
<%--layui使用的js--%>
<script src="layui/lay/modules/layer.js"></script>
<script>
//     window.onload = function () {  //当用户浏览主页的时候使用该方法
//         $.ajax({ //用于请求指定页面的数据，前提是制定页面上必须所有数据
//             type:"post", //请求方式为post
//             url:"getAllPostServlet", //请求的的页面为getAllservlet
//             success:function (result) { //请求成功之后，得到信息result,此时为string类型的
//                 // var ss = JSON.parse(result); //将得到的string类型的转为json
//                 // var imgPath = "image/"+ss[3].userImg;//获取到发帖模块中的img的src路径，采用拼接的形式，
//                 // $("#img").attr('src',imgPath); //将得到图片途径放到id是img的src中
//                 // $("#testtest").html(ss[1].postContent); //将得到的指定的标题写入id为testtest的div中
//                 // for(var i=0;i<allpost.length();i++){
//                 //     var userimg = "image/" + allpost[1].userImg;  //获取用户头像
//                 //     var postContent = allpost[i].postContent;  //获取
//                 // }
//                 // window.reload;
//                 var allpost = JSON.parse(result); //将得到的string类型的转为json
//
// // var imgPath = "image/"+ss[3].userImg;//获取到发帖模块中的img的src路径，采用拼接的形式，
// // $("#img").attr('src',imgPath); //将得到图片途径放到id是img的src中
// // $("#testtest").html(ss[1].postContent); //将得到的指定的标题写入id为testtest的div中
//                 for(var i=0;i<allpost.length();i++){
//                     var userimg = "image/" + allpost[1].userImg;  //获取用户头像
//                     var postContent = allpost[i].postContent;  //获取贴子标题
//                     var userName = allpost[i].userName;
//                     var usertime = allpost[i].userTime;
//                     $("#img").html(userimg);
//                     $("#title").html(postContent);
//                     $("#username").html(userName);
//                     $("#userTime").html(usertime);
//                 }
// // window.reload;
//             }
//         })
//     }
</script>
</body>
</html>

