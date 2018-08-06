<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/8/4
  Time: 1:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
    <style>
        td{
            padding: 10px;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <td>ID</td>
        <td>用户名</td>
        <td>邮箱</td>
        <td>手机号</td>
        <td>性别</td>
        <td>生日</td>
        <td>简述</td>
    </tr>
    <c:forEach items="${userList}" var="u">
        <tr>
            <td>${u.id}</td>
            <td>${u.name}</td>
            <td>${u.email}</td>
            <td>${u.phone}</td>
            <td>${u.sex}</td>
            <td>${u.birthday}</td>
            <td>${u.simpleTalk}</td>

        </tr>

    </c:forEach>
</table>
</body>
</html>
