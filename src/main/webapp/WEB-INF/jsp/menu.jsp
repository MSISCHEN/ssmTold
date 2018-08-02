<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/7/26
  Time: 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="/resources/login_register/css/font-awesome.css"/>
    <link href="/resources/login_register/css/login-register.css" rel="stylesheet" />
    <script src="/resources/login_register/js/login-register.js" type="text/javascript"></script>

</head>
<body>
    <!-- 导航条start -->
   <%-- <div style="margin:10px 2px 100px 2px">
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
                                &lt;%&ndash;<span>${user.id}</span>&ndash;%&gt;
                                <li><a href="/blog"><span class="glyphicon glyphicon-pencil"></span>写博客</a></li>
                                <li><a href="/user/personalPage/${user.id}"><img src="${user.headImg}" width="30" height="30" class="img-circle"></img></a></li>
                                <li><a href="/user/logout">退出</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>

                </div>

            </div>
        </nav>
    </div>--%>
    <!-- 导航条end -->

    <!--登陆注册的模态框-->
    <div class="modal fade login" id="loginModal">
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
    </div>
</body>
</html>
