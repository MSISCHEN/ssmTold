<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/7/30
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/login_register/css/laydate.css" />
    <script src="/resources/login_register/js/laydate.js"></script>
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">编辑简介</h4>
            </div>
            <form action="/user/updateUser">
            <div class="modal-body">
                <div id="error" style="color: #F74933"></div>
                <div>

                        昵称：<input type="text" class="form-control" id="uname" name="uname" value="${user.name}" onblur="checkName();">
                        <c:if test="${user.name!=null}">
                            邮箱：<input type="text" class="form-control has-error" id="email" value="${user.email}" readonly>
                        </c:if>
                        <c:if test="${user.phone!=null}">
                            手机号码：<input type="text" class="form-control has-error" id="phone" value="${user.phone}" readonly>
                        </c:if>
                        性别：
                        <!--单选按钮start-->
                    <div id="sex" >
                        <input type="radio" name="sex" id="sex1" value="男"> 男
                        <input type="radio" name="sex" id="sex2" value="女"> 女
                    </div>
                    <!--单选按钮end-->
                        生日：
                    <!--日历start-->
                    ${user.birthday}
                        <div class="input-group">
                            <span class="input-group-add">
                            <img src="/static/images/calendar.png" alt="" class="icon data-icon"/></span>
                            <input type="text" name="birthday" id="laydateInput" value="${user.birthday}" class="form-control" placeholder="xxxx年xx月xx日"/>
                        </div>
                        <div class="select-date">
                            <div class="select-date-header">
                                <ul class="heade-ul">
                                    <li class="header-item header-item-one">
                                        <select name="" id="yearList"></select>
                                    </li>
                                    <li class="header-item header-item-two" onselectstart="return false">
                                        <select name="" id="monthList"></select>
                                    </li>
                                    <li class="header-item header-item-three" onselectstart="return false" >
                                        <span class="reback">回到今天</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="select-date-body">
                                <ul class="week-list">
                                    <li>日</li><li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li>六</li>
                                </ul>
                                <ul class="day-tabel"></ul>
                            </div>
                        </div>

                    <!--日历end-->
                    简述：<textarea class="form-control" rows="3" id="simpleTalk">${user.simpleTalk}</textarea>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="save" class="btn btn-primary">保存</button>
            </div>
            </form>
        </div>
    </div>
</div>
<script>
    function getSelectDate(result){
        //这里获取选择的日期
        console.log(result);
        alert(result);
    }

//    $("input[name='sex'][checked]").val();//获取被选中的Radio的value值
    /*$(function () {
        $("input[name='sex'][value='${user.sex}']").attr("checked",true);
    })

*/
    function checkName() {
        var name=$("#uname").val();
        alert(name);
        var temp=false;
        $.ajax({
            url:"/user/editorName",
            type:"post",
            async:false,
            data:{"name":name,"id":${user.id}},
            dataType:"json",
            success:function(result){
                alert(result);
                if (result=="1"){
                   $("#error").html("用户名已存在");
                   temp=false;
                }else{
                    $("#error").html("");
                    temp=true;
                }
            },
            error:function(result){

            }
        });
        return temp;
    }
    $("#save").click(function () {
        var name=$("#uname").val();
        var sex=$("input[name='sex'][checked]").val();//获取被选中的Radio的value
        var birthday=$('#laydateInput').val();
        var simpleTalk=$('#simpleTalk').text();
        alert(name+"  "+sex+"  "+birthday+"  "+simpleTalk);
        alert(typeof(birthday));
        /*$.ajax({
            url:"/user/updateUser",
            type:"post",
            async:false,
            data:{"name":name,"id":${user.id},"sex":sex,"birthday":birthday,simpleTalk:simpleTalk},
            dataType:"json",
            success:function(result){
                alert(result);
                if (result=="1"){
                    $("#error").html("用户名已存在");
                    temp=false;
                }else{
                    $("#error").html("");
                    temp=true;
                }
            },
            error:function(result){

            }
        });*/
    })

</script>
</body>
</html>
