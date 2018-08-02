<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/8/2
  Time: 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/easyui.css">
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/icon.css">
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/demo.css">
    <script type="text/javascript" src="/resources/login_register/js/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/login_register/js/jquery.easyui.min.js"></script>

</head>
<body>
<table id="articleList" class="easyui-datagrid" style="width:100%;height:auto;">
    <thead>
    <tr>
        <th field="checkbox">全选</th>
        <th field="articleTitle">文章标题</th>
        <th field="userName">发布者</th>
        <th field="articleUpdateTime">文章更新时间</th>
        <th field="collectionNum">收藏数</th>
        <th field="commentNum">评论数</th>
        <th field="articleLikeNum">点赞数</th>
        <th field="articleStatus">文章状态</th>
        <th field="work">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${articleListVoList}" var="a">
    <tr>
        <td><input type="checkbox" value="${a.articleCustom.articleId}"></td>
        <td>${a.articleCustom.articleTitle}</td>
        <td>${a.userCustom.name}</td>
        <td><fmt:formatDate value="${a.articleCustom.articleUpdateTime}" pattern="MM月dd日 HH:mm"/></td>
        <td>${a.articleCustom.collectionNum}</td>
        <td>${a.articleCustom.commentNum}</td>
        <td>${a.articleCustom.articleLikeNum}</td>
        <td>
            <c:if test="${a.articleCustom.articleStatus==0}">审核中</c:if>
            <c:if test="${a.articleCustom.articleStatus==1}">发表</c:if>
            <c:if test="${a.articleCustom.articleStatus==2}">驳回审核</c:if>
        </td>
        <td>
            <a href="#" class="easyui-linkbutton" id="pass">审核通过</a>
            <a href="#" class="easyui-linkbutton" id="dispass">驳回审核</a>
        </td>
    </tr>
    </c:forEach>

    </tbody>
</table>

<script>
    $("#page").click(function () {
        $.ajax({

        });
    })


</script>

</body>
</html>
