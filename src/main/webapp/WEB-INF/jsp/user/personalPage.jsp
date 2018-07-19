<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/7/5
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false"%>

<html>
<head>
    <title>个人主页</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="/resources/login_register/css/bootstrap.css" rel="stylesheet" />
    <script src="/resources/login_register/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="/resources/login_register/js/bootstrap.js" type="text/javascript"></script>
    <script src="/resources/login_register/js/holder.js" type="text/javascript"></script>
    <script>
        $("#headImg").click(function(){


        });

    </script>
</head>
<body>
<div class="container" >
    <!-- 导航条start -->
    <div style="margin:10px 2px 100px 2px">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a href="/" id="navIndex" class="navbar-brand">TOLD
                        <!--如果有logo可以加这里，并且把文字去掉，设置height=100%就可以正常显示-->
                    </a>
                    <button class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#mynavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div id="mynavbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="javascript:" id="navFood">美食</a></li>
                        <li><a href="javascript:" id="navPet">宠物</a></li>
                        <li><a href="javascript:" id="navStudy">学习</a></li>
                        <li><a href="javascript:" id="navAbout">关于</a></li>
                        <li><a href="javascript:" id="navLink">联系</a></li>


                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/blog"><span class="glyphicon glyphicon-pencil"></span>写博客</a></li>
                        <li><a href="javascript:"><img src="/${user.headImg}" width="30" height="30" class="img-circle"/></a></li>
                        <li><a href="/user/logout">退出</a></li>
                    </ul>

                </div>

            </div>
        </nav>
    </div>
    <!-- 导航条end -->
    <!-- 个人主页部分start -->
    <div id="myBody" style="margin:80px 0px 5px 0px">
        <!--头部个人信息部分start-->
        <div id="bodyHead">
            <div class="row">
                <div class="col-sm-2">
                    <div data-toggle="modal" data-target="#myModal">
                        <img id="headImg" src="/${user.headImg}" width="160px" height="160px"></img>
                    </div>
                    <!-- Modal start-->
                    <div class="modal fade" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="close" data-dismiss="modal">&times;</div>
                                    <h3>修改头像</h3>
                                </div>
                                <div class="modal-body">
                                    <form action="" method="post" enctype="mutipart/form-data">
                                        <label for="file">文件名：</label>
                                        <input id="file" name="file" type="file"/>
                                        <input type="submit" name="submit" value="提交">

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal end -->


                    <div>
                        <span id="agree">6</span>关注
                        <span id="agree">6</span>粉丝
                    </div>
                </div>
                <div class="col-sm-8">
                    <div id="name" style="font-size:24px">${user.name}</div>
                    <div>
                        <span id="email" style="color:#a4a4a4;padding:0px 4px">${user.email}</span> |
                        <span id="phone" style="color:#a4a4a4;padding:0px 4px">${user.phone}</span> |
                        <span id="birthday" style="color:#a4a4a4;padding:0px 4px">${user.birthday}</span> |
                        <span id="sex" style="color:#a4a4a4;padding:0px 4px">${user.sex}</span>
                    </div>
                    <hr>
                    <div id="simpleTalk"><c:choose>
                        <c:when test="${fn:length(user.simpleTalk)<2}">
                            个人简历
                        </c:when>
                        <c:otherwise>
                            ${user.simpleTalk}
                        </c:otherwise>
                    </c:choose>
                    </div>
                </div>
                <div class="col-sm-2"><a href="javascript:"><span class="glyphicon glyphicon-edit"/>修改个人资料</a></div>

            </div>

        </div>
        <!-- 头部个人信息部分end -->

        <!-- 身体文章信息start -->
        <div id="bodyBody">
            <div style="padding:30px 0px">

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">

                    <li role="presentation" class="active"><a href="#articleList" aria-controls="articleList" role="tab" data-toggle="tab">我的博客</a></li>
                    <li role="presentation"><a href="#collection" aria-controls="collection" role="tab" data-toggle="tab">我的收藏</a></li>
                    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">我的关注</a></li>

                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="articleList">
                        <hr>
                        <!-- 显示一篇文章start -->
                        <div>
                            <div class="row">
                                <div class="col-sm-10">
                                    <div id="title">她一直在世界各地旅游</div>
                                    <div id="post_date">2018-07-09 09:09:09</div>

                                </div>
                                <div class="col-sm-2">
                                    <a href="javascript:">编辑</a>
                                    <a href="javascript:">删除</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <!-- 显示一篇文章end
                        <!-- 显示一篇文章start -->
                        <div>
                            <div class="row">
                                <div class="col-sm-10">
                                    <div id="title">她一直在世界各地旅游</div>
                                    <div id="post_date">2018-07-09 09:09:09</div>

                                </div>
                                <div class="col-sm-2">
                                    <a href="javascript:">编辑</a>
                                    <a href="javascript:">删除</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <!-- 显示一篇文章end -->
                        <!-- 显示一篇文章start -->
                        <div>
                            <div class="row">
                                <div class="col-sm-10">
                                    <div id="title">她一直在世界各地旅游</div>
                                    <div id="post_date">2018-07-09 09:09:09</div>

                                </div>
                                <div class="col-sm-2">
                                    <a href="javascript:">编辑</a>
                                    <a href="javascript:">删除</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <!-- 显示一篇文章end -->
                    </div>
                    <div role="tabpanel" class="tab-pane" id="collection">
                        <hr>
                        <!-- 显示一篇文章start -->
                        <div>
                            <div class="row">
                                <div class="col-sm-10">
                                    <div id="title">她一直在世界各地旅游</div>
                                    <div id="post_date">2018-07-09 09:09:09</div>

                                </div>
                                <div class="col-sm-2">
                                    <a href="javascript:">删除</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <!-- 显示一篇文章end -->

                    </div>
                    <div role="tabpanel" class="tab-pane" id="messages">
                        <div style="padding:20px">
					<span style="padding:2px 110px 10px 2px;">
						<img src="holder.js/40x40"></img>
						<span id="userId">c520666123</span>
					</span>
                            <span style="padding:2px 110px 10px 2px;">
						<img src="holder.js/40x40"></img>
						<span id="userId">c520666123</span>
					</span>
                            <span style="padding:2px 110px 10px 2px;">
						<img src="holder.js/40x40"></img>
						<span id="userId">c520666123</span>
					</span>
                            <span style="padding:2px 110px 10px 2px;">
						<img src="holder.js/40x40"></img>
						<span id="userId">c520666123</span>
					</span>
                            <span style="padding:2px 110px 10px 2px;">
						<img src="holder.js/40x40"></img>
						<span id="userId">c520666123</span>
					</span>
                            <span style="padding:2px 80px 10px 2px;">
						<img src="holder.js/40x40"></img>
						<span id="userId">c520666123</span>
					</span>
                            <span style="padding:2px 80px 10px 2px;">
						<img src="holder.js/40x40"></img>
						<span id="userId">c520666123</span>
					</span>
                            <span style="padding:2px 80px 10px 2px;">
						<img src="holder.js/40x40"></img>
						<span id="userId">c520666123</span>
					</span>
                        </div>

                    </div>
                </div>

            </div>


        </div>

        <!-- 身体文章信息end -->
    </div>
    <!-- 个人主页部分end -->
</div>
</body>
</html>
