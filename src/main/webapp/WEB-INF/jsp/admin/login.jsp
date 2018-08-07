<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/8/6
  Time: 22:34
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台登陆</title>
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/body.css"/>
</head>
<body>

<div class="container">
    <section id="content">
        <form action="/admin/login" method="post">
            <h1>管理员登录</h1>
            <div>
                <input type="text" placeholder="用户名" required="" id="adminName" name="adminName" />
            </div>
            <div>
                <input type="password" placeholder="密码" required="" id="adminPassword" name="adminPassword" />
            </div>
            <div class="">
                <span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>			</div>
            <div>
                <%String error=request.getParameter("error");
                    if (error!=null){
                        %>
                <p style="color: red"><%=error%></p>
                <%
                    }

                %>




                <!-- <input type="submit" value="Log in" /> -->
                <input type="submit" value="登录" class="btn btn-primary" id="js-btn-login"/>
            </div>
        </form><!-- form -->

    </section><!-- content -->
</div>
<!-- container -->

</body>
</html>
