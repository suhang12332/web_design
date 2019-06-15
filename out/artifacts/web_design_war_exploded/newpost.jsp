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
    <title>New</title>
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/cover.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
    <link href="css/form.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <style>

    </style>
</head>
<body>
<div class="site-wrapper">
    <div class="demo form-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-3 col-md-6" style="margin-top:20px;">
                    <%--    <div class="htmleaf-container" style="width: 30%; margin: 0 auto;position: relative;top:200px">--%>
                    <form class="form-horizontal" style="opacity: 0.99;z-index: 1; padding:10px 10px">
                        <span class="heading" style="color:#555; font-size:30px;">写帖子</span>
                        <div class="form-group">
                            <p style="color:#000; text-align: left; ">选择板块:</p>
                            <select class="form-control" name="platename" >
                                <option value="Mysql">数据库技术</option>
                                <option value="Java">java技术</option>
                                <option value="HtmlCss">html和css</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="帖子标题" name="posttitle" required>
                        </div>
                        <div class="form-group" >
                            <textarea type="text" class="form-control" placeholder="帖子内容，内容严禁过长" name="postcontent" style="height: 70px" required></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-default btn-block" style="outline: none;"
                                    name="username" formmethod="post" formaction="newPostServlet">发送
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="mastfoot" style="width: 100%;">
        <div class="inner">
            <p>Designed by <a href="#">@su</a></p>
        </div>
    </div>
</div>
<script src="dist/js/jquery.js"></script>
</body>
</html>