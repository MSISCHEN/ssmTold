/*
 *
 * login-register modal
 * Autor: Creative Tim
 * Web-autor: creative.tim
 * Web script: #
 * 
 */
/*注册的jquery验证start*/
    function  checkPhoneAndEmail(){
        var phone=$.trim($('#phone').val());
        var email=$.trim($('.email').val());
        $('#phone').val(phone);
        $('.email').val(email);
        var temp=true;
        // alert(email);
        if (email!="") {
            var pattern=/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
            if (pattern.test(email)) {
                $.ajax({
                    url: "http://localhost:8080/code/findEmailIsExist",
                    type: "post",
                    data: {"email": email},
                    dataType: "json",
                    success: function (result) {
                        if (result) {
                            $('#rerror').attr('class', 'alert alert-danger').html("邮箱已被注册").css('display', 'block').delay(2000).fadeOut();
                            $(".email").attr("class", "alert alert-danger email");
                            $("#send").attr("disabled", "true");
                            temp = false;
                        } else {
                            $(".email").attr("class", "alert alert-success email");
                            $('#rerror').html("").attr('class', 'rerror');
                            $("#send").removeAttr("disabled");//启用按钮

                            temp = true;
                        }
                    }
                });
            } else {
                $('#rerror').attr('class', 'alert alert-danger').html("邮箱无效").css('display', 'block').delay(2000).fadeOut();
                $(".email").attr("class", "alert alert-danger email");
                $("#send").attr("disabled", "true");
                temp = false;
            }
        }else if(phone!=""){
            var pattern = /^1[34578]\d{9}$/;
            if(pattern.test(phone)){

                $.ajax({
                    url:"http://localhost:8080/code/findPhoneIsExist",
                    type:"post",
                    data:{"phone":phone},
                    dataType:"json",
                    success:function(isExist){
                        if (isExist) {

                            $('#rerror').attr('class','alert alert-danger').html("号码已被注册").css('display','block').delay(2000).fadeOut();
                            $("#phone").attr("class","alert alert-danger");
                            $("#send").attr("disabled","true");
                            temp=false;
                        }else{
                            $('#rerror').html("").attr('class','rerror');
                            $("#phone").attr("class","alert alert-success");
                            $("#send").removeAttr("disabled");//启用按钮
                            temp=true;
                        }
                    }
                });
            }else{
                $('#rerror').attr('class','alert alert-danger').html("号码无效").css('display','block').delay(2000).fadeOut();
                $("#phone").attr("class","alert alert-danger");
                $("#send").attr("disabled","true");
                temp=false;
            }
        }
        else{
            $(".email").attr("class","alert alert-danger email");
            $("#phone").attr("class","alert alert-danger");
            // $('#rerror').attr('class','alert alert-danger').html("账号为空").css('display','block').delay(2000).fadeOut();
            $("#send").attr("disabled","true");
            temp=false;

        }
        return temp;
    }
function checkPwd() {
    var $pwd = $('.pwd').val();
    if ($pwd == '' || $pwd.length < 6 || $pwd.length > 8) {
        $(".pwd").attr("class", "alert alert-danger pwd");

        $('#rerror').attr('class', 'alert alert-danger').html("密码长度为6~8").css('display', 'block').delay(4000).fadeOut();
        return false;
    } else {
        $('#rerror').html("").attr('class', 'rerror');
        $(".pwd").attr("class", "alert alert-success pwd");
        return true;
    }
}
function checkRepwd() {
    var $pwd = $('.pwd').val();
    if($('.repwd').val()!=$pwd){
        $(".pwd").attr("class","alert alert-danger pwd");
        $(".repwd").attr("class","alert alert-danger repwd");
        $('#rerror').attr('class','alert alert-danger').html("两次密码不一致").css('display','block').delay(4000).fadeOut();
        return false;
    }
    else{
        $(".pwd").attr("class","alert alert-success pwd");
        $(".repwd").attr("class","alert alert-success repwd");
        $('#rerror').html("").attr('class','rerror');
        return true;
    }
}

function register(){
    if(!checkPhoneAndEmail()){
        return false;
    }else if (!checkCode()){
        return false;
    }else if(!checkPwd()){
        return false;
    }else if(!checkRepwd()){
        return false;
    }else {
        return true;
    }
}
/*发送验证码倒计时*/
    var InterValObj;//timer变量，控制时间
    var count=60;//间隔函数，1秒执行
    var curCount;//当前剩余秒数
    function sendMessage(){

        getCode();
        curCount = count;
        $("#send").attr("disabled", "true");
        $("#send").text(curCount + "秒后可重新发送");
        InterValObj = window.setInterval(setRemainTime, 1000);//启动计时器，1秒执行一次请求后台发送验证码TODO

    }
    //timer处理函数
    function setRemainTime() {
        if (curCount==0){
            window.clearInterval(InterValObj);//停止计时器
            $("#send").removeAttr("disabled");//启用按钮
            $("#send").html("重新发送验证码");
        }else{
            curCount--;
            $("#send").text(curCount+"秒后可重新发送");
        }
    }
var sms="";
    function getCode() {
        var phone=$("#phone").val();
        var email=$(".email").val();
        if (phone!=""){
            $.ajax({
                url:"http://localhost:8080/code/findPhone",
                type:"post",
                data:{"phone":phone},
                dataType:"json",
                success:function(code){
                    if (code!="") {
                        sms = code;
                    }
                }
            });
        }else if(email!=""){
            $.ajax({
                url:"http://localhost:8080/code/findEamilCode",
                type:"post",
                data:{"email":email},
                dataType:"json",
                success:function(code){
                    if (code!="") {
                        sms = code;
                    }else{
                        $('#rerror').attr('class','alert alert-danger').html("邮箱不存在").css('display','block').delay(4000).fadeOut();
                        $(".email").attr("class", "alert alert-danger email");
                        $("#send").attr("disabled", "true");
                    }
                }
            });
        }
    }

    //检查验证码是不是相等
    function checkCode() {
       var code=$("#writeCode").val();
       if(code!=''&&sms==code){
           $("#writeCode").attr("class","alert alert-success");
           $('#rerror').html("").attr('class','rerror');
           return true;
       }else{
           $('#rerror').attr('class','alert alert-danger').html("验证码错误").css('display','block').delay(5000).fadeOut();
           $("#writeCode").attr("class","alert alert-danger");
           return false;
       }
    }

    function phoneClick(){
        $('#rerror').html("").attr('class','rerror');
        $('#phone').attr('type','text');
        $('#phone').attr('class','form-control');
        $('#writeCode').val('').attr('class','form-control');
        $('.email').val('');
        alert('您选择手机号码注册');
        $('.email').attr('type','hidden');
        $('#send').text('发送手机验证码，注意查收');
    }
    function emailClick(){
        $('#rerror').html("").attr('class','rerror');
        $('#writeCode').val('').attr('class','form-control');
        $('#phone').val('');
        alert('您选择邮箱注册');
        $('#phone').attr('type','hidden');
        $('.email').attr('type','text');
        $('.email').attr('class','form-control email');
        $('#send').html('发送邮箱验证码，注意查收');
    }

/*注册jQuery验证end*/

/*登陆的jquery验证start*/
//验证登陆的账户是否存在
function LoginNum(){
    var loginNum=$('#loginNum').val();
    var isLoginNum=true;
    if (loginNum!=""){
        $.ajax({
            url:"http://localhost:8080/code/findLoginNum",
            type:"post",
            data:{"loginNum":loginNum},
            dataType:"json",
            success:function(isExist){
                if (isExist) {
                    $('#error').removeAttr('class','alert alert-danger').html('');
                    isLoginNum=true;
                }else{
                    $('#error').attr('class','alert alert-danger').html('账号不存在');
                    isLoginNum=false;
                }
            }
        });

    }else{
        $('#error').attr('class','alert alert-danger').html('账号不能为空');
        isLoginNum=false;
    }
    return isLoginNum;
}
function LoginPwd(){
    var loginPwd=$('#loginPwd').val();
    if(loginPwd == ''){
        $('#error').attr('class','alert alert-danger').html('密码不能为空');
        return false;
    }else{
        $('#error').removeAttr('class','alert alert-danger').html('');
        return true;
    }
}
function login(){
    if(!LoginNum()){
        return false;
    }else if(!LoginPwd()){
        return false;
    }else{
        return true;
    }
}
/*登陆的jquery验证end*/

function showRegisterForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('Register with');
    });
    $('#error').removeClass('alert alert-danger').html('');

}
function showLoginForm(){
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');
        });

        $('.modal-title').html('Login with');
    });
     $('#error').removeClass('alert alert-danger').html('');
}

function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
        $('#loginModal').modal('show');
    }, 230);

}
function openRegisterModal(){
    showRegisterForm();

    setTimeout(function(){
        $('#loginModal').modal('show');
    }, 230);

}

function loginAjax(){
    var loginNum=$('#loginNum').val();
    var loginPwd=$('#loginPwd').val();

    if(login()) {
        $.ajax({
            url:"http://localhost:8080/user/findUserLogin",
            type:"post",
            data:{"loginNum":loginNum,"loginPwd":loginPwd},
            dataType:"json",
            success:function(result){
                if (result) {
                    $('#error').removeAttr('class','alert alert-danger').html('');
                    window.location.href="http://localhost:8080/user/personalPage";
                }else{
                    shakeModal();
                }
            }
        });

    }
}

function shakeModal(){
    $('#loginModal .modal-dialog').addClass('shake');
             $('#error').addClass('alert alert-danger').html("邮箱/手机号码或者密码错误!");
             $('input[type="password"]').val('');
             setTimeout( function(){
                $('#loginModal .modal-dialog').removeClass('shake');
    }, 1000 );
}

   