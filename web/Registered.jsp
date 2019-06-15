<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/13
  Time: 下午4:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cover Template for Bootstrap</title>
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/cover.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <link href="css/form.css" rel="stylesheet">
    <%--    <link rel="stylesheet" href="css/font.css">--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
</head>
<body>
<div class="site-wrapper">
    <div class="demo form-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-3 col-md-6" style="margin-top:20px;">
                    <%--    <div class="htmleaf-container" style="width: 30%; margin: 0 auto;position: relative;top:200px">--%>
                    <form class="form-horizontal" style="opacity: 0.99;z-index: 1; padding:10px 10px">
                        <span class="heading" style="color:#555; font-size:30px;">用 户 注 册</span><br>
                        <span style="color: red">提示，该页面信息填写完毕之后，无法更改(其实这个功能是懒得写)</span>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="用户名" name="username" required>
                            <i class="fas fa-user"
                               style="text-shadow: 0 1px 3px rgba(0,0,0,.0); font-size: 16px"></i>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="密　码" name="password" required>
                            <i class="fas fa-lock"
                               style=" text-shadow: 0 1px 3px rgba(0,0,0,.0); font-size: 15px"></i>
                        </div>
                        <div class="form-group">
                            <div class="main-checkbox" style="margin-left: 10px">
                                <input type="radio" value="女" id="checkbox1" name="sex" required>
                                <label for="checkbox1"></label>
                            </div>
                            <div class="main-checkbox1" >
                                <a style="color:#555;">女</a>
                            </div>
                            <div class="main-checkbox" style="margin-left: 10px">
                                <input type="radio" value="男" id="checkbox2" name="sex" required>
                                <label for="checkbox2"></label>
                            </div>
                            <div class="main-checkbox1">
                                <a style="color:#555;">男</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Q Q" name="qq" required>
                            <i class="fas fa-qq"
                               style=" text-shadow: 0 1px 3px rgba(0,0,0,.0); font-size: 15px"></i>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Email" name="email" required>
                            <i class="fas fa-envelope"
                               style=" text-shadow: 0 1px 3px rgba(0,0,0,.0); font-size: 15px"></i>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-default btn-block" style="outline: none;"
                                    name="username" formmethod="post" formaction="RegisteredServlet">注册
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="mastfoot" style="width: 100%;">
    <div class="inner">
        <p>Designed by <a href="#">@su</a></p>
    </div>
</div>
<script src="dist/js/bootstrap.min.js"></script>
</body>
</html>
