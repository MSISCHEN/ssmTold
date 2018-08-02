<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/7/6
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Told</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="/resources/login_register/css/bootstrap.css" rel="stylesheet" />
    <script src="/resources/login_register/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="/resources/login_register/js/bootstrap.js" type="text/javascript"></script>
    <script src="/resources/login_register/js/holder.js" type="text/javascript"></script>

    <%--<link rel="stylesheet" href="/resources/login_register/css/font-awesome.css"/>
    <link href="/resources/login_register/css/login-register.css" rel="stylesheet" />
    <script src="/resources/login_register/js/login-register.js" type="text/javascript"></script>
--%>
</head>
<body>
<div class="container" >
    <%@ include file="menu.jsp" %>
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
                        <c:choose>
                            <c:when test="${user==null||user.id==0}">
                                <li><a data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">登陆</a></li>
                                <li><a data-toggle="modal" href="javascript:void(0)" onclick="openRegisterModal();">注册</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/blog"><span class="glyphicon glyphicon-pencil"></span>写博客</a></li>
                                <li><a href="/user/personalPage/${user.id}"><img src="/${user.headImg}" width="30" height="30" class="img-circle"></img></a></li>
                                <li><a href="/user/logout">退出</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>

                </div>

            </div>
        </nav>
    </div>
    <!-- 导航条end -->

    <!--登陆注册的模态框-->
   <%-- <div class="modal fade login" id="loginModal">
        <div class="modal-dialog login animated">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Login with</h4>
                </div>
                <div class="modal-body">
                    <div class="box">
                        <div class="content">
                            <div class="social">
                                <div class="row">

                                    <div class="col-sm-6">
                                        <button type="button" class="btn btn-default btn-lg" id="emailbtn" onclick="emailClick();">
                                            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                        </button>
                                    </div>
                                    <div class="col-sm-6">
                                        <button type="button" class="btn btn-default btn-lg" id="phonebtn" onclick="phoneClick();">
                                            <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
                                        </button>
                                    </div>

                                </div>
                            </div>
                            <div class="division">
                                <div class="line l"></div>
                                <span>-</span>
                                <div class="line r"></div>
                            </div>
                            <div id="error"></div>
                            <div class="form loginBox">
                                <form method="post" accept-charset="UTF-8">
                                    <input id="loginNum" class="form-control" type="text" placeholder="邮箱/手机号码" name="loginNum">
                                    <input id="loginPwd" class="form-control" type="password" placeholder="密码" name="password">
                                    <input class="btn btn-default btn-login" type="button" value="登陆" onclick="loginAjax();">
                                </form>

                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="content registerBox" style="display:none;">

                            <div class="form">
                                <form method="post" html="{:multipart=>true}" data-remote="true" action="/user/insertUser" accept-charset="UTF-8" onsubmit="return register();">
                                    <input id="email" class="form-control email" type="text" placeholder="邮箱注册" name="email" onblur="checkPhoneAndEmail()">
                                    <input id="phone" class="form-control" type="hidden" placeholder="手机号码注册" name="phone" onblur="checkPhoneAndEmail()">

                                    <button type="button" class="btn btn-default" id="send" data-toggle="tooltip" data-placement="right" title="Send verification code" onclick="sendMessage();" disabled>发送邮箱验证码，请注意查收</button>
                                    <input id="writeCode" class="form-control" type="text" placeholder="输入验证码" name="writeCode" onblur="checkCode();">

                                    <input id="password" class="form-control pwd" type="password" placeholder="密码" name="password" onblur="checkPwd();">
                                    <input id="password_confirmation" class="form-control repwd" type="password" placeholder="确认密码" name="password_confirmation" onblur="checkRepwd();">
                                    <input class="btn btn-default btn-register" type="submit" value="注册" name="commit">
                                </form>
                            </div>
                            <div id="rerror" class="rerror"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="forgot login-footer">
                            <span>去
                                 <a href="javascript: showRegisterForm();">注册</a>
                            ?</span>
                    </div>
                    <div class="forgot register-footer" style="display:none">
                        <span>已注册?</span>
                        <a href="javascript: showLoginForm();">登陆</a>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>

    <!-- 首页显示的内容start -->
    <div id="myIndex" style="margin:50px 20px 10px 20px">
        <div class="row">
            <div id="left" class="col-sm-8">
                <!--滑动图start-->
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="../../static/images/一座桥.jpg" alt="">
                            <div class="carousel-caption">
                                生活如同一番风景
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../static/images/冰山雪地.jpg" alt="">
                            <div class="carousel-caption">
                                做人与做事
                            </div>
                        </div>
                        <div class="item">
                            <img src="../../static/images/一个悲伤的鸭子.jpg" alt="">
                            <div class="carousel-caption">
                                她一直在世界各地旅行
                            </div>
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

                <!--滑动图end-->
                <!-- 显示文章start -->
                <c:if test="${articleList.pageNum!=0}">
                    <c:forEach items="${articleList.list}" var="article">
                        <div style="padding:30px 2px">
                            <div class="media">
                                <div class="pull-left">
                                    <a href="/article/findBlog/${article.articleId}">
                                        <img class="media-object thumbnail" src="/static/images/${article.articleCast}.jpg" width="80px" height="80px" alt="...">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading" id="title">${article.articleTitle}</h4>
                                    <div style="color:#a3a3a3;font-size:12px;line-height:12px;">
                                        <span>
                                            发布日期：<fmt:formatDate value="${article.articlePostTime}"
                                                                 pattern="MM月dd日 HH:mm"/>
                                            分类：<span id="cate">${article.articleCast}</span>
                                        </span>
                                    </div>
                                    <div id="description" style="color:#777777;font-size:12px;">
                                        <p>${article.articleDescription} </p>
                                    </div>
                                    <div style="color:#a3a3a3;font-size:12px;line-height:12px;">
                                        <span>
                                            点赞数：${article.articleLikeNum}
                                            收藏数：${article.collectionNum}
                                            评论数：${article.commentNum}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>


                <!-- 显示文章end -->
                <c:choose>

                    <c:when test="${searchKey==null}">
                        <div id="nonal">
                            <!--分页-->
                            <c:if test="${articleList.pages>1}">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <c:if test="${!articleList.isFirstPage}">
                                            <li>
                                                <a href="/p/1" aria-label="Previous">
                                                    <span aria-hidden="true"><<</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${articleList.hasPreviousPage}">
                                            <li>
                                                <a href="/p/${articleList.prePage}" aria-label="Previous">
                                                    <span aria-hidden="true"><</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:choose>
                                            <c:when test="${articleList.pages <= 3 }">
                                                <c:set var="begin" value="1"/>
                                                <c:set var="end" value="${articleList.pages }"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="begin" value="${articleList.pageNum-1 }"/>
                                                <c:set var="end" value="${articleList.pageNum + 2}"/>
                                                <c:if test="${begin < 2 }">
                                                    <c:set var="begin" value="1"/>
                                                    <c:set var="end" value="3"/>
                                                </c:if>
                                                <c:if test="${end > articleList.size }">
                                                    <c:set var="begin" value="${articleList.pages-2 }"/>
                                                    <c:set var="end" value="${articleList.pages }"/>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                            <%--显示第一页的页码--%>
                                        <c:if test="${begin >= 2 }">
                                            <li><a class="page-numbers" href="/p/1">1</a></li>
                                        </c:if>
                                            <%--显示点点点--%>
                                        <c:if test="${begin  > 2 }">
                                            <li><span class="page-numbers dots">…</span></li>
                                        </c:if>
                                            <%--打印 页码--%>
                                        <c:forEach begin="${begin }" end="${end }" var="i">
                                            <c:choose>
                                                <c:when test="${i eq articleList.pageNum }">
                                                    <li><a class="page-numbers current" >${i}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li><a  class="page-numbers" href="/p/${i}">${i }</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                            <%-- 显示点点点 --%>
                                        <c:if test="${end < articleList.pages-1 }">
                                            <li><span class="page-numbers dots">…</span></li>
                                        </c:if>
                                            <%-- 显示最后一页的数字 --%>
                                        <c:if test="${end < articleList.pages }">
                                            <li><a href="/p/${articleList.pages}">
                                                    ${articleList.pages}
                                            </a></li>
                                        </c:if>


                                        <c:if test="${articleList.hasNextPage}">
                                            <li>
                                                <a href="/p/${articleList.nextPage}" aria-label="Next">
                                                    <span aria-hidden="true">></span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${!articleList.isLastPage}">
                                            <li>
                                                <a href="/p/${articleList.lastPage}" aria-label="Next">
                                                    <span aria-hidden="true">>></span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>
                            </c:if>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div id="isSearch">
                            <!--分页-->
                            <c:if test="${articleList.pages>1}">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination">
                                        <c:if test="${!articleList.isFirstPage}">
                                            <li>
                                                <a href="/p/1/search?searchKey=${searchKey}" aria-label="Previous">
                                                    <span aria-hidden="true"><<</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${articleList.hasPreviousPage}">
                                            <li>
                                                <a href="/p/${articleList.prePage}/search?searchKey=${searchKey}" aria-label="Previous">
                                                    <span aria-hidden="true"><</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:choose>
                                            <c:when test="${articleList.pages <= 3 }">
                                                <c:set var="begin" value="1"/>
                                                <c:set var="end" value="${articleList.pages }"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="begin" value="${articleList.pageNum-1 }"/>
                                                <c:set var="end" value="${articleList.pageNum + 2}"/>
                                                <c:if test="${begin < 2 }">
                                                    <c:set var="begin" value="1"/>
                                                    <c:set var="end" value="3"/>
                                                </c:if>
                                                <c:if test="${end > articleList.size }">
                                                    <c:set var="begin" value="${articleList.pages-2 }"/>
                                                    <c:set var="end" value="${articleList.pages }"/>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                            <%--<li><a href="/p/1">1</a></li>
                                            <li><a href="/p/2">2</a></li>--%>

                                            <%--显示第一页的页码--%>
                                        <c:if test="${begin >= 2 }">
                                            <li><a class="page-numbers" href="/p/1/search?searchKey=${searchKey}">1</a></li>
                                        </c:if>
                                            <%--显示点点点--%>
                                        <c:if test="${begin  > 2 }">
                                            <li><span class="page-numbers dots">…</span></li>
                                        </c:if>
                                            <%--打印 页码--%>
                                        <c:forEach begin="${begin }" end="${end }" var="i">
                                            <c:choose>
                                                <c:when test="${i eq articleList.pageNum }">
                                                    <li><a class="page-numbers current" >${i}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li><a  class="page-numbers" href="/p/${i}/search?searchKey=${searchKey}">${i }</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                            <%-- 显示点点点 --%>
                                        <c:if test="${end < articleList.pages-1 }">
                                            <li><span class="page-numbers dots">…</span></li>
                                        </c:if>
                                            <%-- 显示最后一页的数字 --%>
                                        <c:if test="${end < articleList.pages }">
                                            <li><a href="/p/${articleList.pages}/search?searchKey=${searchKey}">
                                                    ${articleList.pages}
                                            </a></li>
                                        </c:if>

                                        <c:if test="${articleList.hasNextPage}">
                                            <li>
                                                <a href="/p/${articleList.nextPage}/search?searchKey=${searchKey}" aria-label="Next">
                                                    <span aria-hidden="true">></span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${!articleList.isLastPage}">
                                            <li>
                                                <a href="/p/${articleList.lastPage}/search?searchKey=${searchKey}" aria-label="Next">
                                                    <span aria-hidden="true">>></span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>
                            </c:if>

                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 右边 -->
            <div id="right" class="col-sm-4">
                <!-- 搜索框 -->
                <form class="form-inline" id="searchForm" method="get" action="/p/1/search">
                    <div class="form-group">
                        <%--<label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>--%>
                        <div class="input-group">
                            <input type="text" class="form-control" id="searchKey" name="searchKey" placeholder="请输入需要搜索的文字">
                            <div class="input-group-addon" id="search"><span class="glyphicon glyphicon-search"></span></div>
                        </div>
                    </div>
                </form>
                <!-- 推荐文章start -->
                <div class="panel panel-default" style="margin:30px 0px 5px 0px">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h3>推荐文章</h3>
                        </div>
                    </div>
                    <div class="list-group">
                        <a href="" class="list-group-item">
                            <h4 class="media-heading" id="recommend_title">Media heading</h4>
                            <div style="color:#a3a3a3;font-size:12px;line-height:12px;">
								<span>
									发布日期：<span id="recommend_post_date">2018-07-08</span>
									分类：<span id="recommend_cate">宠物</span>
								</span>
                            </div>

                        </a>
                        <a href="" class="list-group-item">
                            <h4 class="media-heading" id="recommend_title">Media heading</h4>
                            <div style="color:#a3a3a3;font-size:12px;line-height:12px;">
								<span>
									发布日期：<span id="recommend_post_date">2018-07-08</span>
									分类：<span id="recommend_cate">宠物</span>
								</span>
                            </div>
                        </a>
                        <a href="" class="list-group-item">
                            <h4 class="media-heading" id="recommend_title">Media heading</h4>
                            <div style="color:#a3a3a3;font-size:12px;line-height:12px;">
								<span>
									发布日期：<span id="recommend_post_date">2018-07-08</span>
									分类：<span id="recommend_cate">宠物</span>
								</span>
                            </div>
                        </a>
                    </div>

                </div>
                <!-- 推荐文章end -->

                <!-- 通知start -->
                <div class="panel panel-danger" style="margin:30px 0px 5px 0px">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h3>通知</h3>
                        </div>
                    </div>
                    <div class="list-group">
                        <a href="" class="list-group-item">
							<span id="notice">
								通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容
							</span>


                        </a>
                        <a href="" class="list-group-item">
							<span id="notice">
								通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容
							</span>
                        </a>
                        <a href="" class="list-group-item">
							<span id="notice">
								通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容通知内容
							</span>
                        </a>
                    </div>

                </div>
                <!-- 通知end -->
            </div>
        </div>
    </div>
    <!-- 首页显示的内容end -->

    <!-- 关于我们的内容start -->
    <div id="about" style="padding:30px 0px 5px 0px;text-align:center;display:none;">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <img src="../../static/images/logo.gif"/>
                <h1>关于我们</h1>
                <p>记录那些正在发生的事情和已经发生的事情。
                    We are recording the things are happening and already there. Thanks for your interesting.
                </p>
                <p>有时并不是因为看到了希望才去坚持，而是坚持了才会看到希望.</p>
            </div>
            <!-- <div class="col-sm-3"></div> -->
        </div>
    </div>
    <!-- 关于我们的内容end -->

    <!-- 联系的内容start -->
    <div id="link" style="padding:30px 0px 5px 0px;text-align:center;display:none">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <span class=""></span>
				<form>
					<div class="form-group">
						<input type="text" class="form-control" id="link_name" placeholder="姓名"/><br>
						<input type="email" class="form-control" id="link_email1" placeholder="邮箱"/><br>
						<input type="text" class="form-control" id="link_phone" placeholder="联系电话"/><br>
						<textarea class="form-control" rows="3" placeholder="内容"></textarea><br>
						<input class="btn btn-default" type="submit" value="Submit"/>
					</div>
				</form>
            </div>
        </div>
    </div>
    <!-- 联系的内容end -->
    <hr>
    <!-- 页脚start -->
    <div class="footer" id="footer" style="padding:5px 0px 5px 0px;">

        <div class="row">
            <div class="col-sm-2 col-sm-offset-1">
                <h6>关于我们</h6>
                <p>
                    记录那些正在发生的事情和已经发生的事情。
                </p>
                <p>
                We are recording the things are happening and already there. Thanks for your interesting.
                </p>
            </div>
            <div class="col-sm-2 col-sm-offset-2">
                <h6>友情链接</h6>
                <p>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">百度&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">CSDN&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>
                    <a href="#">知乎&nbsp;&nbsp;&nbsp;</a>

                </p>
            </div>
            <div class="col-sm-2 col-sm-offset-2">
                <h6>推荐图片</h6>
                <p>
                    <img src="../../static/images/logo.gif"/>
                </p>
            </div>
        </div>
    </div>
    <!-- 页脚end -->

    <!-- <div style="position:fixed;top:400px;left:1350px;">
        <a href="#"><span class="glyphicon glyphicon-chevron-up"></span></a>
    </div> -->
    <script>
        $('#navAbout').click(function(){
            $("#myIndex").css("display","none");
            $("#link").css("display","none");
            $("#about").css("display","block");
        });
        $('#navLink').click(function(){
            $("#myIndex").css("display","none");
            $("#link").css("display","block");
            $("#about").css("display","none");
        });
        $('#navIndex').click(function(){
            $("#myIndex").css("display","block");
            $("#link").css("display","none");
            $("#about").css("display","none");
        });
        $('#search').click(function () {
            $("#searchForm").submit();
        })
    </script>
</div>
</body>

</html>
