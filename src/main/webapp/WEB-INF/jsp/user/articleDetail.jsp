<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/7/14
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false"%>

<html>
<head>
    <title>文章显示</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="/resources/login_register/css/bootstrap.css" rel="stylesheet" />
    <script src="/resources/login_register/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="/resources/login_register/js/bootstrap.js" type="text/javascript"></script>
    <script src="/resources/login_register/js/holder.js" type="text/javascript"></script>
    <script>
        $(function () {

            $("#insertComment").click(function () {
                var commentContent=$("#commentContent").val();
                var articleId=$("#articleId").val();
                var userId=$("#userId").val();
                alert("----"+articleId+commentContent+userId);
                if (commentContent!=""&&articleId!=""&&userId!=""){
                    $.ajax({
                        url:"http://localhost:8080/comment/insertComment",
                        type:"post",
                        data:{"commentContent":commentContent,"commentArticleId":articleId,"commentAuthorId":userId},
                        dataType:"text",
                        success:function(commentId){
                            alert(commentId);
                            if (commentId!=0) {
                                alert("发表成功");
                                window.location.href="http://localhost:8080/user/personalPage";

                            }else{
                                alert("发表失败");

                            }
                        },
                        error:function(commentId){
                            alert(commentId);
                            if (commentId!=0) {
                                alert("发表成功");
                                window.location.href="http://localhost:8080/user/personalPage";


                            }else{
                                alert("发表失败");

                            }
                        }
                    });
                }else{
                    alert("请输入内容！");
                }
            });
        });
    </script>
</head>
<body>
<!-- <div class="container" > -->
<!-- 导航条start -->
<div>
    <nav class="navbar navbar-default">
        <div class="container" style="padding:1px 40px">
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

                <!-- <ul class="nav navbar-nav navbar-right">
                        <c:choose>
                            <c:when test="${user==null||user.id==0}">
                                <li><a data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">登陆</a></li>
                                <li><a data-toggle="modal" href="javascript:void(0)" onclick="openRegisterModal();">注册</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/blog"><span class="glyphicon glyphicon-pencil"></span>写博客</a></li>
                                <li><a href="/user/personalPage"><img src="${user.headImg}" width="30" height="30" class="img-circle"></img></a></li>
                                <li><a href="/user/logout">退出</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul> -->

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="">登陆</a></li>
                    <li><a href="">注册</a></li>
                </ul>
            </div>

        </div>
    </nav>
</div>
<!-- 导航条end -->
<!-- 该文章博客的名字start -->
<div style="height:83px;background-image:url(/static/images/blog0.png);padding:1px 200px">
    <div style="color:#fff"><h3>${userArticleCustom.user.name}</h3></div>
    <div style="color:#b8b8b8;font-size:12px">${userArticleCustom.user.simpleTalk}</div>
</div>
<!-- 该文章博客的名字end -->
<!-- 旁边选项start -->
<div>
    <div class="list-group" style="width: 80px;position:fixed;padding: 80px 2px;margin: 45px">
        <a class="list-group-item" id="java" href="javascript:"><div class="glyphicon glyphicon-thumbs-up"></div></a>
        <a class="list-group-item" id="css" href="javascript:"><span class="glyphicon glyphicon-edit"></span><div>评论</div></a>
        <a class="list-group-item" id="html" href="javascript:"><span class="glyphicon glyphicon-bookmark"></span><div>收藏</div></a>

    </div>

</div>
<!-- 旁边选项end -->
<div class="container">
    <div >


        <!-- 显示的左边start -->
        <div class="row">

            <div class="col-sm-9">
                <div class="jumbotron">
                    <h2>${userArticleCustom.article.articleTitle}</h2>

                    <div style="color:#858585;font-size:12px"><fmt:formatDate value="${userArticleCustom.article.articlePostTime}"
                                                                              pattern="MM月dd日 HH:mm"/></div>
                    <hr width="100%" style="border-top:1px solid #93a1a1;" />
                    <div>
                        ${userArticleCustom.article.articleContent}
                    </div>
                </div>


                <!-- 评论区域start -->
                <div class="jumbotron" style="margin:10px 1px">
                    <div class="row">
                        <form id="formComment" method="post">
                            <input type="hidden" value="${user.id}" id="userId">
                            <input type="hidden" value="${userArticleCustom.article.articleId}" id="articleId">
                            <div class="col-sm-1"><img src="/${user.headImg}" width="30" height="30"/></div>

                            <div class="col-sm-9">
                                <div id="inputComment">
                                    <textarea id="commentContent" name="commentContent" class="form-control" style="min-width: 90%" placeholder="想对作者说点什么"></textarea>
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-danger" id="insertComment">发表评论</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- 评论区域end -->
                <!-- 评论列表start -->
                <div id="comment" style="margin:10px 1px">
                    <
                    <div style="border:1px dashed #93a1a1;padding: 10px 10px">
                        <div class="row">
                            <div class="col-sm-2">
                                <img src="/${user.headImg}" width="45" height="45">
                            </div>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-9">
                                        <div style="font-size:12px">评论内容。。。。。。。。。。。。</div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div style="font-size: 12px;color: #aaaaaa">2018-07-15 09:09:09</div>
                                    </div>
                                </div>

                                <hr width="100%" style="border:1px solid #93a1a1" />

                                <div class="row">
                                    <!-- 评论第二层评论 -->
                                    <div class="col-sm-2">
                                        <img src="/static/images/dog.jpg" width="45" height="45">
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <div style="font-size:12px">评论内容。。。。。。。。。。。。</div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div style="font-size: 12px;color: #aaaaaa">2018-07-15 09:09:09</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- 评论列表end-->

            </div>

            <!-- 显示的左边end -->

            <!-- 显示的右边start -->
            <div class="col-sm-3">
                <div><h3>个人资料</h3></div>
                <div class="row">
                    <div class="col-sm-8">
                        <img src="/static/images/dog.jpg" width="45" height="45">
                        <span>c1249629019</span>
                    </div>
                    <div class="col-sm-4">
                        <a class="btn btn-danger">关注</a>
                    </div>
                </div>
                <hr width="100%" style="border:1px solid #93a1a1" />
                <div class="row">
                    <div class="col-sm-4">
                        文章
                    </div>
                    <div class="col-sm-4">
                        粉丝
                    </div>
                    <div class="col-sm-4">
                        评论
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        12
                    </div>
                    <div class="col-sm-4">
                        100
                    </div>
                    <div class="col-sm-4">
                        100
                    </div>
                </div>
            </div>
            <!-- 显示的右边end -->

        </div>
    </div>
    <!-- </div> -->
</div>
</body>
</html>
