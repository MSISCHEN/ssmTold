<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/7/10
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>发表博客</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="/resources/login_register/css/bootstrap.css" rel="stylesheet" />
    <script src="/resources/login_register/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="/resources/login_register/js/bootstrap.js" type="text/javascript"></script>
    <script src="/resources/login_register/js/holder.js" type="text/javascript"></script>

    <!-- 配置文件 -->
    <script type="text/javascript" src="resources/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="resources/ueditor/ueditor.all.js"></script>

</head>

<body>

<div class="container">

    <!-- 导航条start -->
    <div style="margin:10px 2px 100px 2px">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a href="/index.jsp" id="navIndex" class="navbar-brand">
                        <!--如果有logo可以加这里，并且把文字去掉，设置height=100%就可以正常显示-->
                        <img src="resources/ueditor/logo2.gif"/>
                    </a>
                </div>
                <div id="mynavbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li style="font-size:35px"><a href=""><span class="glyphicon glyphicon-pencil"></span>写博客</a></li>
                        <li><a href="/user/personalPage"><img src="/${user.headImg}" width="45" height="45" class="img-circle"/></a></li>
                    </ul>

                </div>

            </div>
        </nav>
    </div>
    <!-- 导航条end -->
    <form>
        <div style="padding:10px 0px 20px 0px">
            <div class="input-group input-group-lg">
                <input type="text" id="title" class="form-control" placeholder="输入文章标题" aria-describedby="sizing-addon1">
            </div>
        </div>

        <textarea class="form-control" rows="3" maxlength="200" onchange="this.value=this.value.substring(0, 200)" onkeydown="this.value=this.value.substring(0, 200)" onkeyup="this.value=this.value.substring(0, 200)"  style="resize:none;" placeholder="简述这篇文章，字数在30~200字之间" id="description"></textarea>

        <!-- 文本编辑器start -->
        <div style="padding:30px 0px 0px 0px">
            <!-- 加载编辑器的容器 -->
            <script id="content" name="content" type="text/plain">
					这里写你的初始化内容
				</script>
            <!-- 实例化编辑器 -->
            <script type="text/javascript">
                var ue = UE.getEditor('content',{
                    toolbars: [
                        ['fullscreen', 'source', 'undo', 'redo', 'cleardoc', 'bold', 'italic', 'underline', 'strikethrough', 'fontfamily', 'fontsize', 'forecolor', 'backcolor', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify','simpleupload', 'insertimage','edittable', 'edittd', 'link', 'unlink', 'emotion', 'spechars', 'inserttable', 'insertrow', 'insertcol', 'mergeright', 'mergedown', 'deleterow', 'deletecol', 'splittorows', 'splittocols', 'splittocells', 'deletecaption', 'inserttitle', 'mergecells', 'deletetable', 'insertparagraphbeforetable']
                    ]
                });
            </script>
        </div>
        <!-- 文本编辑器end -->

        <div style="padding:30px 5px">
            <span>文章类型：</span>
            <select id="cast" class="form-control">
                <option value="other">其他</option>
                <option value="food">美食</option>
                <option value="pet">宠物</option>
                <option value="study">学习</option>
            </select>


        </div>

        <div style="padding:0px 0px 30px 0px">
            <input title="发布博客" class="btn btn-success" id="btnPublish" type="submit" value="发布博客">
            &nbsp;&nbsp;&nbsp;
            <input title="返回列表页" class="btn btn-danger" id="btnCancel" type="cancel" value="返回">
        </div>
    </form>
</div>
</body>

</html>
