<%@ page import="util.dateNow" %><%--
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
<div class="site-wrapper" style="background: #333;color:#fff;">
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
                                                <input class="input-medium search-query searchinput" type="text" style="text-align: center;color:#000000" name="search">
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
    <div class="demo form-bg" style="position:relative;top: 51px;">
        <div class="container">
            <c:if test="${requestScope.postandReturnpost.getClass().toString()==\"class bean.PostandUser\"}">
                <div class="row clearfix" style="background: rgba(255,255,255,.1);border-radius: 10px;">
                    <div class="col-md-3 column" style="padding-top: 5%;">
                        <img alt="140x140" src="image/${requestScope.postandReturnpost.userImg}" height="100px" width="100px"
                             class="img-rounded"><br>
                        <br>
                        <div onclick="window.location.href='userInPostServlet?${requestScope.postandReturnpost.userName}'" ><h4>${requestScope.postandReturnpost.userName}
                                ${requestScope.postandReturnpost.userSex=="男"?"<i class=\"fas fa-mars\" style=\"color:#00b4ef\"></i>":"<i class=\"fas fa-venus\" style=\"color:#d44950\"></i>"}</h4>
                        </div>
                    </div>
                    <div class="col-md-9 column" style="padding-top: 5%;padding-bottom: 5%">
                        <h2> ${requestScope.postandReturnpost.postTitle} <span class="badge"
                                                                               style="background-color: #ff6927;float: right;margin-top: 10px">楼主</span>
                        </h2>
                        <span><i class="fas fa-eye" style="color: #ff6927;"></i>&nbsp;&nbsp;&nbsp;&nbsp;0</span>
                        <span><i class="fas fa-comments" style="color: #ff6927;"></i>&nbsp;&nbsp;&nbsp;0</span>
                        <br><br>
                        <p>${requestScope.postandReturnpost.postContent}</p>
                        <p>
                    </div>
                    <span style="float: left;margin-left: 15px">${requestScope.postandReturnpost.postTime}</span>
                </div>
            </c:if>
            <c:if test="${requestScope.postandReturnpost.getClass().toString()==\"class java.util.ArrayList\"}">
                <div class="row clearfix" style="background: rgba(255,255,255,.1);border-radius: 10px;">
                    <div class="col-md-3 column" style="padding-top: 5%;">

                        <img alt="140x140" src="image/${applicationScope.postandUser.userImg}" height="100px" width="100px"
                             class="img-rounded"><br>
                        <br>
                        <div onclick="window.location.href='userInPostServlet?${applicationScope.postandUser.userName}'"><h4>${applicationScope.postandUser.userName}
                                ${applicationScope.postandUser.userSex=="男"?"<i class=\"fas fa-mars\" style=\"color:#00b4ef\"></i>":"<i class=\"fas fa-venus\" style=\"color:#d44950\"></i>"}</h4>
                        </div>
                    </div>
                    <div class="col-md-9 column" style="padding-top: 5%;padding-bottom: 5%">
                        <h2> ${applicationScope.postandUser.postTitle} <span class="badge"
                                                                               style="background-color: #ff6927;float: right;margin-top: 10px">楼主</span>
                        </h2>
                        <span><i class="fas fa-comments" style="color: #ff6927;">&nbsp;&nbsp;&nbsp;${requestScope.postandReturnpost.size()}</i></span>
                        <br><br>
                        <p>${applicationScope.postandUser.postContent}</p>
                        <p>
                    </div>
                    <span style="float: left;margin-left: 15px">${applicationScope.postandUser.postTime}</span>
                </div>
            </c:if>
            <c:if test="${requestScope.postandReturnpost.getClass().toString()==\"class bean.PostandUser\"}">
                    <c:if test="${sessionScope.user==null}">
                        <div class="row clearfix" style="background: rgba(255,255,255,.1);border-radius: 10px;margin-top: 10px">
                            <div class="col-md-12 column">
                                <br>
                                <a href="login.jsp" style="color:#fff"><h5>登录之后才能回复</h5></a><br>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.user!=null}">
                        <div class="row clearfix" style="background: rgba(255,255,255,.1);border-radius: 10px;margin-top: 10px">
                            <div class="col-md-12 column">
                                <br>
                                <h5>暂无回复</h5>
                                <br>
                            </div>
                        </div>
                    </c:if>
            </c:if>
            <c:if test="${requestScope.postandReturnpost.getClass().toString()==\"class java.util.ArrayList\"}">
                <c:forEach items="${requestScope.postandReturnpost}" begin="0"
                           end="${requestScope.postandReturnpost.size()}" varStatus="status">
                    <div class="row clearfix" style="background: rgba(255,255,255,.1);border-radius: 10px; margin-top: 10px;width: 98%;margin-left: 1%;">
                        <div class="col-md-3 column" style="padding-top: 2%;">
                            <img alt="140x140" src="image/${requestScope.postandReturnpost[status.index].userImg}" height="50px" width="50px"
                                 class="img-rounded"><br>
                            <br>
                            <div onclick="window.location.href='userInPostServlet?${requestScope.postandReturnpost[status.index].userName}'"><h4 style="margin-top: 0px">${requestScope.postandReturnpost[status.index].userName}
                                    ${requestScope.postandReturnpost[status.index].userSex=="男"?"<i class=\"fas fa-mars\" style=\"color:#00b4ef\"></i>":"<i class=\"fas fa-venus\" style=\"color:#d44950\"></i>"}</h4>
                            </div>

                        </div>
                        <div class="col-md-9 column">
                            <br>
                            <h5>${requestScope.postandReturnpost[status.index].returnContent}</h5>
                            <span class="badge"
                                  style="background-color: #ff6927;float: right;margin-bottom: 10px">${status.index+1}楼</span>
                        </div>
                        <span style="float: left;margin-left: 15px">${requestScope.postandReturnpost[status.index].returnTime}</span>
                    </div>
                </c:forEach>
            </c:if>
        </div>
        <c:if test="${requestScope.postandReturnpost.getClass().toString()==\"class bean.PostandUser\"}">
            <div class="panel panel-default"
                 style="border-color: transparent; background-color: transparent">
                <div class="panel-heading" style="background-color: transparent">
                    <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-922227"
                       href="#panel-element-673376" style="color:#fff;"><i class="fas fa-edit home"></i>回复</a>
                </div>
                <div class="container">
                    <div id="panel-element-673376" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="panel-body">
                                <div class="row clearfix" >
                                    <c:if test="${sessionScope.user==null}">
                                        <div class="row clearfix" style="border-radius: 10px;margin-top: 10px">
                                            <div class="col-md-12 column" style="color:#fff;">
                                                <br>
                                                <a href="login.jsp"><h5 style="color:#fff;">登录之后才能回复</h5></a>
                                                <br>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.user!=null}">
                                        <form>
                                            <div class="col-md-12 column">
                                                <textarea type="text" class="form-control" placeholder="填写回帖内容，内容不要过长" name="returnContent" style="border-radius: 15px;text-align: center" required></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-default" style="outline: none;background: transparent;border-color: transparent;margin-top: 10px"
                                                    name="username" formmethod="post" formaction="returnPostInformationServlet?${requestScope.postandReturnpost.postId}" ><a style="color: #fff">确认</a>
                                            </button>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="inner">
                    <p>Designed by <a href="#" style="text-decoration: none;color:#fff;">@su</a></p>
                </div>
            </div>
        </c:if>
        <c:if test="${requestScope.postandReturnpost.getClass().toString()==\"class java.util.ArrayList\"}">
            <div class="panel panel-default"
                 style="border-color: transparent; background-color: transparent">
                <div class="panel-heading" style="background-color: transparent">
                    <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-922227"
                       href="#panel-element-673377" style="color:#fff;"><i class="fas fa-edit home"></i>回复</a>
                </div>
                <div class="container">
                    <div id="panel-element-673377" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="panel-body">
                                <div class="row clearfix" >
                                    <c:if test="${sessionScope.user==null}">
                                        <div class="row clearfix" style="border-radius: 10px;margin-top: 10px">
                                            <div class="col-md-12 column">
                                                <br>
                                                <a href="login.jsp"><h5  style="color:#fff;">登录之后才能回复</h5></a>
                                                <br>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.user!=null}">
                                        <form>
                                            <div class="col-md-12 column">
                                                <textarea type="text" class="form-control" placeholder="填写回帖内容，内容不要过长" name="returnContent" style="border-radius: 15px;text-align: center" required id="replay"></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-default" style="outline: none;background: transparent;border-color: transparent;margin-top: 10px"
                                                    name="username" formmethod="post" formaction="returnPostInformationServlet?${requestScope.postandReturnpost[0].postId}"><a style="color: #fff">确认</a>
                                            </button>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="inner">
                    <p>Designed by @su</p>
                </div>
            </div>
        </c:if>
    </div>
</div>
</body>
<script src="dist/js/jquery.min.js"></script>
<script src="dist/js/bootstrap.min.js"></script>
<script>
</script>
</html>

