<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/6/6
  Time: 上午11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
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
<style>
    .table-h:hover{
        background: rgba(255,255,255,.1);
        border-radius: 10px;
    }
</style>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 columns"><h2>下面是一些查找的内容</h2></div>
        <div class="col-md-12 column">
            <c:forEach items="${requestScope.search}" begin="0" end="${requestScope.search.size()}"
                       varStatus="status">
                <table class="table table-condensed table-h"
                       onclick="window.location.href='postInformationServlet?${requestScope.search[status.index].postId}'">
                    <tbody>
                    <tr>
                        <th style="border-top: 0px solid transparent; background: rgba(255,255,255,0.05); border-radius: 10px">
                            <div class="photo" style="float: left;margin: 8px"><img src="image/${requestScope.search[status.index].userImg}"
                                                    height="40" width="40" class="img-rounded"></div>
                            <div class="title" style="margin: 8px">${requestScope.search[status.index].postTitle}
                                <div>
                                    <a href="userInPostServlet?${requestScope.search[status.index].userName}"
                                       class="aherf">${requestScope.search[status.index].userName}</a>
                                    <span class="">|</span>
                                    <a href="postInformationServlet?${requestScope.search[status.index].postId}"
                                       class="aherf">${requestScope.search[status.index].postTime}</a>
                                </div>
                            </div>
                        </th>
                    </tr>
                </table>
            </c:forEach>
        </div>
    </div>
</div>
<div class="mastfoot" style="width: 100%;">
    <div class="inner">
        <p>Designed by <a href="#">@su</a></p>
    </div>
</div>
<script src="dist/js/jquery.min.js"></script>
<script src="dist/js/bootstrap.min.js"></script>
</body>
</html>
