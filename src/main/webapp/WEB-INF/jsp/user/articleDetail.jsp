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

            </div>
            <div id="mynavbar" class="collapse navbar-collapse">

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
<%@ include file="../menu.jsp" %>
<!-- 该文章博客的名字start -->
<div style="height:83px;background-image:url(/static/images/blog0.png);padding:1px 200px">
    <div style="color:#fff;font-size: 20px" id="userCustomName">${articleDetailVo.userCustom.name}</div>
    <div style="color:#b8b8b8;font-size:12px">${articleDetailVo.userCustom.simpleTalk}</div>
</div>
<!-- 该文章博客的名字end -->
<!-- 旁边选项start -->
<div>
    <div class="list-group" style="width: 80px;position:fixed;padding: 80px 2px;margin: 45px">
        <a class="list-group-item" id="articleLike" href="javascript:void(0)" onclick="updateArticleLikeNum();"><div class="glyphicon glyphicon-thumbs-up"></div><div id="articleLikeNum">${articleDetailVo.articleCustom.articleLikeNum}</div></a>
        <a class="list-group-item" href="#formComment"><span class="glyphicon glyphicon-edit"></span><div>评论${articleDetailVo.articleCustom.commentNum}</div></a>
        <a class="list-group-item" id="collection" href="javascript:void(0)" onclick="insertCollection();"><span class="glyphicon glyphicon-bookmark"></span><div>收藏<span id="collectionNum">${collectionNum}</span></div></a>

    </div>

</div>
<!-- 旁边选项end -->
<div class="container">
    <div >
        <input type="hidden" value="${articleDetailVo.articleCustom.articleId}" id="articleId">


        <!-- 显示的左边start -->
        <div class="row">

            <div class="col-sm-9">
                <div class="jumbotron">
                    <h2>${articleDetailVo.articleCustom.articleTitle}</h2>

                    <div style="color:#858585;font-size:12px"><fmt:formatDate value="${articleDetailVo.articleCustom.articlePostTime}"
                                                                              pattern="MM月dd日 HH:mm"/></div>
                    <hr width="100%" style="border-top:1px solid #93a1a1;" />
                    <div>
                        ${articleDetailVo.articleCustom.articleContent}
                    </div>
                </div>

                <div class="commentArea">
                    <c:choose>
                        <c:when test="${user!=null}">
                        <!-- 评论区域start -->
                        <div class="jumbotron" style="margin:10px 1px" id="send">
                            <div class="row">
                                <div id="formComment">
                                    <input type="hidden" value="${articleDetailVo.userCustom.name}" id="articleCustomName">
                                    <input type="hidden" value="${user.name}" id="userName">
                                    <input type="hidden" value="${user.id}" id="userId">

                                    <input type="hidden" value="${user.headImg}" id="headImg">
                                    <input type="hidden" name="commentPid" id="commentPid" value="0">
                                    <input type="hidden" name="commentPname" id="commentPname" value="">

                                    <div class="col-sm-1"><img src="/${user.headImg}" width="30" height="30"/></div>

                                    <div class="col-sm-9">
                                        <div id="inputComment">
                                            <textarea id="commentContent" name="commentContent" class="form-control" style="min-width: 90%" placeholder="想对作者说点什么"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-sm-2">
                                        <button class="btn btn-danger" id="insertComment">发表评论</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 评论区域end -->
                        </c:when>
                        <c:otherwise>
                            <div style="background-color: #e7e7e7">
                                <span style="padding: 30% 35%">
                                相对作者说什么？<button class="btn btn-danger" onclick="openLoginModal();">我来说一句</button>
                                </span>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <!-- 评论列表start -->
                    <div id="comment" style="margin:10px 1px">
                        <c:set var="floor" value="0"/>

                        <c:forEach items="${articleDetailVo.commentCustomList}" var="coms">
                                <c:if test="${coms.commentPid==0}">
                                    <c:set var="floor" value="${floor+1}"/>
                                    <div style="border:1px dashed #93a1a1;padding: 10px 10px">
                                        <div class="row">
                                            <div class="col-sm-1">

                                                <img src="/${coms.commentAuthorHeadImg}" width="45" height="45">
                                            </div>
                                            <div class="col-sm-11">
                                            <div class="row rollOne">
                                                <div class="col-sm-9">
                                                    <input type="hidden" id="comId" value="${coms.commentId}">
                                                    <strong>${coms.commentAuthorName}</strong>
                                                       <c:if test="${coms.commentAuthorName==articleDetailVo.userCustom.name}">
                                                           <span class="badge">博主</span>

                                                       </c:if>
                                                       &nbsp;&nbsp;
                                                       <span style="font-size: 12px;color: #aaaaaa">
                                                           <fmt:formatDate value="${coms.commentCreateTime}" pattern="yyyy年MM月dd日 HH:mm:ss"/>
                                                           <span> &nbsp;${floor}楼 </span>
                                                       </span>

                                                    <div style="font-size:12px">${coms.commentContent}</div>
                                                </div>
                                                <div class="col-sm-3">
                                                    <span class="menu">
                                                        <c:if test="${user!=null}">
                                                            <a href="#send" class="btn btn-link-blue reply">回复</a>
                                                        </c:if>
                                                    </span>

                                                </div>
                                            </div>

                                            <!--回复系列-->
                                            <div class="children">
                                                <%--<hr width="100%" style="border:1px solid #93a1a1" />--%>
                                                <c:set value="0" var="floor2"/>
                                                <c:forEach items="${articleDetailVo.commentCustomList}" var="c2">
                                                    <c:if test="${coms.commentId==c2.commentPid}">
                                                        <hr width="100%" style="border:1px solid #93a1a1" />
                                                        <c:set var="floor2" value="${floor2+1}"/>
                                                        <div class="row">
                                                            <!-- 评论第二层评论 -->
                                                            <div class="col-sm-1">
                                                                <%--<input type="hidden" id="comId2" value="${c2.commentId}">--%>
                                                                <img src="/${c2.commentAuthorHeadImg}" width="45" height="45">
                                                            </div>
                                                            <div class="col-sm-11">
                                                                <div class="row rollOne">
                                                                    <div class="col-sm-9">
                                                                        <input type="hidden" id="comId" value="${coms.commentId}">
                                                                        <strong>${c2.commentAuthorName}</strong>
                                                                        <c:if test="${c2.commentAuthorName==articleDetailVo.userCustom.name}">
                                                                            <span class="badge">博主</span>

                                                                        </c:if>
                                                                        &nbsp;&nbsp;
                                                                        <span style="font-size: 12px;color: #aaaaaa">
                                                                            <fmt:formatDate value="${c2.commentCreateTime}" pattern="yyyy年MM月dd日 HH:mm:ss"/>
                                                                            <span class="floor"> &nbsp;${floor2}层 </span>
                                                                        </span>
                                                                        <div style="font-size:12px">
                                                                                <c:if test="${c2.commentPid!=0}">
                                                                                    <span style="color: aquamarine">@ ${c2.commentPname}</span>
                                                                                </c:if>
                                                                                ${c2.commentContent}

                                                                        </div>
                                                                    </div>
                                                                    <div class="col-sm-3">

                                                                            <span class="menu">
                                                                                <c:if test="${user!=null}">
                                                                                    <a href="#send" class="btn btn-link-blue reply">回复</a>
                                                                                </c:if>
                                                                            </span>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                        </c:forEach>
                    </div>
                    <!-- 评论列表end-->
                </div>
            </div>

            <!-- 显示的左边end -->

            <!-- 显示的右边start -->
            <div class="col-sm-3">
                <div><h3>个人资料</h3></div>
                <div class="row">
                    <div class="col-sm-8">
                        <img src="/${articleDetailVo.userCustom.headImg}" width="45" height="45">
                        <span>${articleDetailVo.userCustom.name}</span>
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
<script src="/resources/login_register/js/comment.js" type="text/javascript"></script>

</body>

</html>
