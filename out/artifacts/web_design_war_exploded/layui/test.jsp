<%--
  Created by IntelliJ IDEA.
  User: su
  Date: 2019/5/19
  Time: 上午12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>开始使用layui</title>
    <link rel="stylesheet" href="css/layui.css">
    <link rel="stylesheet" href="css/modules/layer/default/layer1.css">
</head>
<body>

<!-- 你的HTML代码 -->
<button onclick="iframe()">suhang</button>
<button onclick="design()">22</button>
<button onclick="ddd()">11</button>
<script src="layui.js"></script>
<script src="lay/modules/layer.js"></script>
<script>
    function iframe() {
        layer.open({
            type: 2,
            title: '很多时候，我们想最大化看，比如像这个页面。',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['893px', '600px'],
            content: '//fly.layui.com/'
        });
    }
    function design() {
        layer.open({
            type: 1,
            // skin: 'layui-layer-rim', //加上边框
            area: ['420px', '240px'], //宽高
            content: '../login.jsp'
        });
    }
    function ddd() {
        layer.open({
            type: 2,
            title: 'layer mobile页',
            shadeClose: true,
            shade: 0.8,
            area: ['893px', '600px'],
            content: '../login.jsp' //iframe的urlccdc
        });
    }
</script>
</body>
</html>