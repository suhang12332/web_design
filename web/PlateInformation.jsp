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
        }

        .modal-backdrop {
            z-index: 0;
        }
        a:hover{
            text-decoration: none;
        }
        .photo {
            float: left;
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
<div class="site-wrapper" style="background: #333;color: white">
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
    <div class="demo form-bg" >
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column" style="margin-top: 6%">
                    <div style="margin-top: 20px;margin-bottom: 10px;">
                        <h3>${requestScope.PostandPlate[0].plateName}</h3>
                        <h5>该板块共有${requestScope.PostandPlate[0].platePostcount}篇帖子。</h5>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span12">
                        <form class="form-search">
                            <input class="input-medium search-query" type="text"
                                   style="border: 1px solid; border-radius: 10px;outline: none;color: #333333;text-align: center"/>
                            <button type="submit"
                                    style="background: transparent;border-color: transparent;outline: none" ><i
                                    class="fas fa-search" style="text-align: center"></i></button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="panel-group" id="panel-922227">
                        <div class="panel panel-default"
                             style="border-color: transparent; background-color: transparent">
                            <div class="panel-heading" style="background-color: transparent">
                                <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-922227"
                                   href="#panel-element-300251" style="color:#fff;">点击从查看该板块的所有帖子</a>
                            </div>
                            <div id="panel-element-300251" class="panel-collapse collapse">
                                <div class="panel-body" style="  text-color: #fff;">
                                    <c:forEach items="${requestScope.PostandPlate}" begin="0"
                                               end="${requestScope.PostandPlate.size()}" varStatus="status">
                                        <table class="table table-condensed table-h"
                                               onclick="window.location.href='postInformationServlet?${requestScope.PostandPlate[status.index].postId}'">
                                            <tbody>
                                            <tr>
                                                <th style="border-top: 0px solid transparent; background: rgba(255,255,255,0.05); border-radius: 10px">
                                                    <div class="photo" style="float: left;margin: 8px"><img src="image/${requestScope.PostandPlate[status.index].userImg}"
                                                                                                            height="40" width="40" class="img-rounded"></div>
                                                    <div class="title" style="margin: 8px">${requestScope.PostandPlate[status.index].postTitle}
                                                        <div>
                                                            <a href="userInPostServlet?${requestScope.PostandPlate[status.index].userName}"
                                                               class="aherf">${requestScope.PostandPlate[status.index].userName}</a>
                                                            <span class="">|</span>
                                                            <a href="postInformationServlet?${requestScope.PostandPlate[status.index].postId}"
                                                               class="aherf">${requestScope.PostandPlate[status.index].postTime}</a>
                                                        </div>
                                                    </div>
                                                </th>
                                            </tr>
                                        </table>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default"
                             style="border-color: transparent; background-color: transparent">

                            <div class="inner">
                                <p>Designed by <a href="#" style="color: #fff;">@su</a></p>
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
