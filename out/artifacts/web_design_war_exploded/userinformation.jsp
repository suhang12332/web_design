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
    <title>Login</title>
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/cover.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <link href="css/form.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <style>
        label {
            display: inline-block;
            width: 50px;
            height: 50px;
            line-height: .8rem;
            text-align: left;
            position: relative;
        }

        label input {
            width: 40px;
            height: 40px;
            vertical-align: bottom;
            margin-right: .1rem;
            opacity: 0;
        }

        .spot {
            display: inline-block;
            background-size: 16px;
            position: absolute;
            top: .2rem;
            left: 0;
            z-index: 5;
        }

        input:checked + .spot {
            background-size: 16px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.9);
        }
    </style>
</head>
<body>
<div class="site-wrapper">
    <div class="demo form-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-3 col-md-6" style="margin-top:20px;">
                    <form class="form-horizontal" style="opacity: 0.99;z-index: 1; padding:10px 10px">
                        <span class="heading" style="color:#555; font-size:30px;">完善和修改部分用户信息</span>
                        <div class="form-group">
                            <input type="date" class="form-control" name="birthday" required>
                            <i class="fas fa-calendar-alt"
                               style=" text-shadow: 0 1px 3px rgba(0,0,0,.0); font-size: 15px"></i>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="个性签名" name="usersate" required>
                            <i class="fas fa-user-tag"
                               style=" text-shadow: 0 1px 3px rgba(0,0,0,.0); font-size: 15px"></i>
                        </div>
                        <div class="form-group">
                            <div class="panel panel-default" style="border-color: transparent">
                                <div class="panel-heading"
                                     style="border-color: transparent;width:35%;border-radius: 30px">
                                    <a class="panel-title" data-toggle="collapse" data-parent="#panel-550895"
                                       href="#panel-element-261559">选择头像</a>
                                </div>
                                <div id="panel-element-261559" class="panel-collapse in">
                                    <div class="panel-body">
                                        <label><input type="radio" name="userimg" value="001.png"><img
                                                src="image/001.png" class="spot" height="40px" width="40px"
                                                style="position: absolute;top:0px;left:0px"></label>
                                        <label><input type="radio" name="userimg" value="002.png"><img
                                                src="image/002.png" class="spot" height="40px" width="40px"
                                                style="position: absolute;top:0px;left:0px"></label>
                                        <label><input type="radio" name="userimg" value="003.png"><img
                                                src="image/003.png" class="spot" height="40px" width="40px"
                                                style="position: absolute;top:0px;left:0px"></label>
                                        <label><input type="radio" name="userimg" value="004.png"><img
                                                src="image/004.png" class="spot" height="40px" width="40px"
                                                style="position: absolute;top:0px;left:0px"></label>
                                        <label><input type="radio" name="userimg" value="005.png"><img
                                                src="image/005.png" class="spot" height="40px" width="40px"
                                                style="position: absolute;top:0px;left:0px"></label>
                                        <label><input type="radio" name="userimg" value="006.png"><img
                                                src="image/006.png" class="spot" height="40px" width="40px"
                                                style="position: absolute;top:0px;left:0px"></label>
                                        <label><input type="radio" name="userimg" value="007.png"><img
                                                src="image/007.png" class="spot" height="40px" width="40px"
                                                style="position: absolute;top:0px;left:0px"></label>
                                        <label><input type="radio" name="userimg" value="008.png"><img
                                                src="image/008.png" class="spot" height="40px" width="40px"
                                                style="position: absolute;top:0px;left:0px"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-default btn-block" style="outline: none;"
                                        name="username" formmethod="post" formaction="userInformationServlet">确　认
                                </button>
                            </div>
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
<script src="dist/js/jquery.min.js"></script>
<script src="dist/js/bootstrap.min.js"></script>
</body>
</html>