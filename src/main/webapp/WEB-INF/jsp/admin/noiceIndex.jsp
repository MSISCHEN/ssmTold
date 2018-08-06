<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/8/3
  Time: 23:32
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
    <style>
        td{
            padding: 10px;
        }
    </style>
</head>
<body>
<input type="button" value="导出Excel" onclick="exportxls()"/>
<table>
    <tr>
        <td>序号</td>
        <td>通知内容</td>
        <td>时间</td>
        <td>状态</td>
        <td>操作</td>
    </tr>
    <c:set value="0" var="temp"/>
    <c:forEach items="${noicesList}" var="n">

        <tr>
            <c:set var="temp" value="${temp+1}"/>
            <td>
                    ${temp}
            </td>
            <td>${n.noiceContent}</td>
            <td><fmt:formatDate value="${n.noiceCreateTime}" pattern="yyyy年MM月dd日 HH:mm"/></td>
            <td>
                <c:choose>
                    <c:when test="${n.noiceStatus==0}">下架中</c:when>
                    <c:otherwise>上架中</c:otherwise>
                </c:choose>

            </td>
            <td>
                <a href="javascript:void(0)" class="easyui-linkbutton pass" onclick="updateStatus(${n.noiceId},1,${temp-1});">上架</a>
                <a href="javascript:void(0)" class="easyui-linkbutton dispass" onclick="updateStatus(${n.noiceId},0,${temp-1});">下架</a>
            </td>
        </tr>

    </c:forEach>
</table>
</body>
<script>
    function updateStatus(noiceId,noiceStatus,temp) {
        $.ajax({
            url:"/admin/updateNoicesStatus",
            type:"post",
            data:{"noiceId":noiceId,"noiceStatus":noiceStatus},
            success:function(){
                alert($(".pass:eq("+temp+")").parent('td').prev().html());
                if (noiceStatus==1){

                    $(".pass:eq("+temp+")").parent('td').prev().html("上架");

                }else{
                    $(".dispass:eq("+temp+")").parent('td').prev().html("下架");
                }
            },
            error:function () {
                if (noiceStatus==1){

                    $(".pass:eq("+temp+")").parent('td').prev().html("上架");
                }else{
                    $(".dispass:eq("+temp+")").parent('td').prev().html("下架");
                }
            }
        });
    }
    function exportxls()
    {
        window.location = "${pageContext.request.contextPath}/admin/export";
    }
</script>
</html>