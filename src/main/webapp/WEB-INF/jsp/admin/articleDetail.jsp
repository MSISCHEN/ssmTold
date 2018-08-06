<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/8/2
  Time: 21:52
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
<STYLE>
    td{
        padding: 10px;
    }

</STYLE>
</head>
<body>
<table>
    <c:set value="0" var="temp"/>

    <tr></tr>
    <tr>
        <td>序号</td>
        <td>文章标题</td>
        <td>发布者</td>
        <td>文章更新时间</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${articleListVoList}" var="a">
        <tr>
            <c:set var="temp" value="${temp+1}"/>
            <td>
                    ${temp}
            </td>
            <td>${a.articleCustom.articleTitle}</td>
            <td>${a.userCustom.name}</td>
            <td><fmt:formatDate value="${a.articleCustom.articleUpdateTime}" pattern="yyyy年MM月dd日 HH:mm"/></td>
            <td>
                <c:choose>
                    <c:when test="${status==0}">
                        <a href="javascript:void(0)" class="easyui-linkbutton pass" onclick="updateStatus(${a.articleCustom.articleId},1,${temp-1});">审核通过</a>
                        <a href="#" class="easyui-linkbutton dispass" onclick="updateStatus(${a.articleCustom.articleId},2,${temp-1});">驳回审核</a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:void(0)" class="easyui-linkbutton pass" onclick="updateStatus(${a.articleCustom.articleId},1,${temp-1});">审核通过</a>
                    </c:otherwise>
                </c:choose>
                <c:if test="${status==1}"></c:if>


            </td>



        </tr>

    </c:forEach>
</table>
<script>
    function updateStatus(articleId,articleStatus,temp) {
        $.ajax({
            url:"/admin/updateStatus",
            type:"post",
            data:{"articleId":articleId,"articleStatus":articleStatus},
            success:function(){
                $(".pass:eq("+temp+")").parent('td').parent('tr').remove();
            },
            error:function () {
                $(".pass:eq("+temp+")").parent('td').parent('tr').remove();

            }
        });
    }


</script>
</body>
</html>
