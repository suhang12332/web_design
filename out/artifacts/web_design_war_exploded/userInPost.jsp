<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/29
  Time: 上午1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login</title>
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/cover1.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <link href="css/form.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
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
        table{
            text-align: center;
        }

        .table-h:hover{
            background: rgba(255,255,255,.1);
            border-radius: 10px;
        }
        a:link{text-decoration:none ;}
        a:visited {text-decoration:none ; }
        a:hover {text-decoration:none ;}
        a:active {text-decoration:none ; }
    </style>
</head>
<body>
<div class="site-wrapper" style="background: #333">
    <div class="navbar-wrapper" >
        <div class="container" style="width: 100%;">
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
                                        ${sessionScope.user.userSex=="男"?"<i class=\"fas fa-mars\" style=\"color:#00b4ef\"></i>":"<i class=\"fas fa-venus\" style=\"color:#d44950\"></i>"} <%--括号中的双引号，需使用转义--%>
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
    <div class="demo form-bg" style="position:relative; top: 51px;color: #fff;">
        <div class="container">
            <div class="row clearfix">
                <c:if test="${requestScope.user.getClass().toString()==\"class bean.User\"}">
                    <div class="col-md-6 column" style="margin-top: 6%">
                        <img alt="140x140" src="image/${requestScope.user.userImg}" height="150px" width="150px"
                             class="img-circle"/><br>
                        <div style="margin-top: 20px;margin-bottom: 10px;">${requestScope.user.userName}</div>
                    </div>
                    <div class="col-md-6 column">
                        <table class="table" style="margin-top: 20px;color:#fff;">
                            <tbody>
                            <tr>
                                <td style="border-top:0px solid transparent;">用户名:</td>
                                <td style="border-top:0px solid transparent;">${requestScope.user.userName}</td>
                            </tr>
                            <tr>
                                <td style="border-top:0px solid transparent;">邮箱：</td>
                                <td style="border-top:0px solid transparent;"> ${requestScope.user.userEmail}</td>
                            </tr>
                            <tr>
                                <td style="border-top:0px solid transparent;">生日：</td>
                                <td style="border-top:0px solid transparent;">${requestScope.user.userBirthday}</td>
                            </tr>
                            <tr>
                                <td style="border-top:0px solid transparent;">QQ：</td>
                                <td style="border-top:0px solid transparent;">${requestScope.user.userQQ}</td>
                            </tr>
                            <td style="border-top:0px solid transparent;">用户名:</td>
                            <td style="border-top:0px solid transparent;">${requestScope.user.userName}</td>

                            <tr>
                                <td style="border-top:0px solid transparent;">性 别:</td>
                                <td style="border-top:0px solid transparent;">${requestScope.user.userSex=="男"?"<i class=\"fas fa-mars\" style=\"color:#00b4ef\"></i>":"<i class=\"fas fa-venus\" style=\"color:#00b4ef\"></i>"}</td>
                            </tr>
                            <tr>
                                <td style="border-top:0px solid transparent;">个性签名:</td>
                                <td style="border-top:0px solid transparent;">${requestScope.user.userSate}</td>
                            </tr>
                            <tr>
                                <td style="border-top:0px solid transparent;">注册日期:</td>
                                <td style="border-top:0px solid transparent;">${requestScope.user.userDate}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </c:if>
                <c:if test="${requestScope.user.getClass().toString()==\"class java.util.ArrayList\"}">
                    <div class="col-md-6 column" style="margin-top: 6%">
                        <img alt="140x140" src="image/${requestScope.user[0].userImg}" height="150px" width="150px"
                             class="img-circle"/><br>
                        <div style="margin-top: 20px;margin-bottom: 10px;">${requestScope.user[0].userName}</div>
                    </div>
                    <div class="col-md-6 column">
                        <table class="table" style="margin-top: 20px;color:#fff;">
                            <tbody>
                            <tr>
                                <td style="border-top:0px solid transparent;">用户名:</td>
                                <td style="border-top:0px solid transparent;">${requestScope.user[0].userName}</td>
                            </tr>
                            <tr>
                                <td style="border-top:0px solid transparent;">邮箱：</td>
                                <td style="border-top:0px solid transparent;"> ${requestScope.user[0].userEmail}</td>
                            </tr>
                            <tr>
                                <td style="border-top:0px solid transparent;">生日：</td>
                                <td style="border-top:0px solid transparent;">${requestScope.user[0].userBirthday}</td>
                            </tr>
                            <tr>
                                <td style="border-top:0px solid transparent;">QQ：</td>
                                <td style="border-top:0px solid transparent;">${requestScope.user[0].userQQ}</td>
                            </tr>
                            <td style="border-top:0px solid transparent;">用户名:</td>
                            <td style="border-top:0px solid transparent;">${requestScope.user[0].userName}</td>

                            <tr>
                                <td style="border-top:0px solid transparent;">性 别:</td>
                                <td style="border-top:0px solid transparent;">${requestScope.user[0].userSex=="男"?"<i class=\"fas fa-mars\" style=\"color:#00b4ef\"></i>":"<i class=\"fas fa-venus\" style=\"color:#00b4ef\"></i>"}</td>
                            </tr>
                            <tr>
                                <td style="border-top:0px solid transparent;">个性签名:</td>
                                <td style="border-top:0px solid transparent;">${requestScope.user[0].userSate}</td>
                            </tr>
                            <tr>
                                <td style="border-top:0px solid transparent;">注册日期:</td>
                                <td style="border-top:0px solid transparent;">${requestScope.user[0].userDate}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="panel-group" id="panel-922227">
                        <div class="panel panel-default"
                             style="border-color: transparent; background-color: transparent">
                            <div class="panel-heading" style="background-color: transparent">
                                <c:if test="${requestScope.user.getClass().toString()==\"class bean.User\"}">
                                    <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-922227"
                                       href="#panel-element-300251" style="color:#fff;">用户还没有帖子</a>
                                </c:if>
                                <c:if test="${requestScope.user.getClass().toString()==\"class java.util.ArrayList\"}">
                                    <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-922227"
                                       href="#panel-element-300251" style="color:#fff;">我的帖子, 一共有${requestScope.user.size()}篇</a>
                                </c:if>
                            </div>
                            <div id="panel-element-300251" class="panel-collapse collapse">
                                <div class="panel-body" >
                                    <c:if test="${requestScope.user.getClass().toString()==\"class bean.User\"}">
                                        <a href="newpost.jsp" ><h4 style="color:#fff;">请发帖</h4></a>
                                    </c:if>
                                    <c:if test="${requestScope.user.getClass().toString()==\"class java.util.ArrayList\"}">
                                        <c:forEach items="${requestScope.user}" begin="0"
                                                   end="${requestScope.user.size()}" varStatus="status">
                                            <table class="table table-condensed table-h" style="color: #fff;">
                                                <tbody>
                                                <tr>
                                                    <th style="border-top:0px solid transparent;text-align: center;background: rgba(255,255,255,0.05); border-radius: 10px">
                                                        <span style="float: right" class="fas fa-trash-alt" onclick="window.location.href='deletePostServlet?${requestScope.user[status.index].postId}'"></span>
                                                        <div class="title" onclick="window.location.href='postInformationServlet?${requestScope.user[status.index].postId}'">${requestScope.user[status.index].postTitle}
                                                            <div>
                                                                <a href="" style="color:#fff;">${requestScope.user[status.index].postTime}</a>
                                                            </div>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </table>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default"
                             style="border-color: transparent; background-color: transparent">
                            <div class="panel-heading" style="background-color: transparent">
                                <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-922227"
                                   href="#panel-element-673377" style="color:#fff;">我的回复
                                <c:if test="${requestScope.ret.size()==0}">
                                    0
                                </c:if>
                                    <c:if test="${requestScope.ret.size()!=0}">
                                        ${requestScope.ret.size()}
                                    </c:if>条
                                </a>
                            </div>
                            <div id="panel-element-673377" class="panel-collapse collapse">
                                <c:if test="${requestScope.ret.size()==0}">
                                    <div class="panel-body">
                                        暂时没有回帖子信息
                                    </div>
                                </c:if>
                                <c:if test="${requestScope.ret.size()!=0}">
                                    <div class="panel-body">
                                        <c:forEach items="${requestScope.ret}" begin="0"
                                                   end="${requestScope.ret.size()}" varStatus="status">
                                            <table class="table table-condensed table-h" style="color: #fff;">
                                                <tbody>
                                                <tr>
                                                    <th style="border-top:0px solid transparent;text-align: center;background: rgba(255,255,255,0.05); border-radius: 10px">
                                                        <h2 style="color: #fff;">${requestScope.ret[status.index].returnContent}</h2>
                                                        <div class="title" onclick="window.location.href='postInformationServlet?${requestScope.ret[status.index].postId}'">${requestScope.ret[status.index].postTitle}

                                                            <div>
                                                                <a href="" style="color:#fff;">${requestScope.ret[status.index].returnTime}</a>
                                                            </div>
                                                        </div>
                                                    </th>
                                                </tr>
                                            </table>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </div>
                            <div class="inner">
                                <p>Designed by <a href="#" style="text-decoration: none;color:#fff;">@su</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="dist/js/jquery.min.js"></script>
<script src="dist/js/bootstrap.min.js"></script>
</html>
