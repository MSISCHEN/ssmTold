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
