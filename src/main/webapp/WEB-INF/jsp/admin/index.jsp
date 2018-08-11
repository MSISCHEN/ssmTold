<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/8/1
  Time: 3:52
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/easyui.css">
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/icon.css">
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/demo.css">


</head>
<body>

<div style="margin:10px 0;"></div>
<div class="easyui-layout" style="width:100%;height:700px;">
    <div data-options="region:'north'" style="height:80px;padding: 15px">
        <img src="/static/images/logo.gif" width="94px" height="42px"/>
        <span style="padding: 10px">
        <a href="/admin/logout" class="easyui-linkbutton">退出</a>
        </span>
    </div>
    <div data-options="region:'south',split:true" style="height:50px;text-align:center">
        <span>©copy amini</span>

    </div>
    <div data-options="region:'west',split:true" title="后台管理" style="width:200px;">
        <div class="easyui-accordion" data-options="fit:true,border:false">
            <div title="文章" style="padding:10px;">
                <ul>
                    <li><a href="#" class="easyui-linkbutton" onclick="addTab('全部文章','/admin/articleList')">全部文章</a></li>
                    <li><a href="#" class="easyui-linkbutton" onclick="addTab('未审核文章','/admin/articleDoList/0')">未审核文章</a></li>
                    <li><a href="#" class="easyui-linkbutton" onclick="addTab('驳回文章','/admin/articleDoList/2')">驳回文章</a></li>
                </ul>
            </div>
            <div title="通知"<%-- data-options="selected:true"--%> style="padding:10px;">
                <ul>
                <li><a href="#" class="easyui-linkbutton" onclick="addTab('通知列表','/admin/noiceIndex')">通知列表</a></li>
                </ul>
            </div>
            <div title="用户" style="padding:10px">
                <ul>
                    <li><a href="#" class="easyui-linkbutton" onclick="addTab('用户列表','/admin/userIndex')">用户列表</a></li>
                </ul>
            </div>
        </div>

    </div>
    <div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
        <div class="easyui-tabs" id="tt" data-options="fit:true,border:false,plain:true">
            <div title="详情" style="padding:10px">
                <table style="background-color: inherit">
                    <tr>
                        <td>用户总数</td>
                        <td>${adminCustom.userNum}</td>
                    </tr>
                    <tr>
                        <td>文章总数</td>
                        <td>${adminCustom.allArticleNum}</td>
                    </tr>
                    <tr>
                        <td>待审核数</td>
                        <td>${adminCustom.allArticleNum-adminCustom.articlePassNum-adminCustom.articleDispassNum}</td>
                    </tr>
                </table>
            </div>
            <div title="通知操作" style="padding:10px;">
                <form id="addNoice">
                    <textarea id="content" name="content" style="margin: 20px;padding: 10px;width:80%;height:100px"></textarea>
                    <input type="button" value="添加" onclick="sub()">
                </form>

                <div style="padding: 30px">
                    <hr/>
                    <form method="POST"  enctype="multipart/form-data" id="form1" action="/admin/import">
                        <table>
                            <tr>
                                <td>上传文件: </td>
                                <td> <input id="upfile" type="file" name="upfile"></td>
                            </tr>

                        </table>
                    </form>
                    <input type="button" value="提交" id="btn" name="btn" onclick="impotr();" >
                </div>

            </div>
        </div>

    </div>
</div>

<script>
    function addTab(title, url){
        if ($('#tt').tabs('exists', title)){
            $('#tt').tabs('select', title);
        } else {
            var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
            $('#tt').tabs('add',{
                title:title,
                content:content,
                closable:true
            });
        }
    }
    function sub() {
        var content=$.trim($("#content").val());
        if(content!=null&&content!=""){
            $("#content").val("");
            $("#_easyui_textbox_input1").val("");


            $.ajax({
                url:"/admin/insertNoices",
                type:"post",
                data:{"noiceContent":content},
                success:function(){
                   /* alert($("#content").text());
                    $("#content").text("");
                    alert($("#content").val());
                    alert($("#content").html());*/
                    alert("添加成功");
                },
                error:function () {
                   /* $("#content").val("");
                    $(".textbox-value").val("");*/
                    alert("添加成功");
                }
            });
        }else{
            alert("请输入通知内容");
        }
    }

    //ajax方式上传文件操作
    function impotr(){
        if(checkData()){
            $('#form1').ajaxSubmit({
                success: resutlMsg,
                error: resutlMsg
            });
            function resutlMsg(){
                alert("导入成功");
                $("#upfile").val("");
            }
        }
    }

    //JS校验form表单信息

    function checkData(){
        var fileDir = $("#upfile").val();
        var suffix = fileDir.substr(fileDir.lastIndexOf("."));
        var temp=true;
        if("" == fileDir){
            alert("选择需要导入的Excel文件！");
            temp=false;
        }
        if(".xls" != suffix && ".xlsx" != suffix ){
            alert("选择Excel格式的文件导入！");
            temp=false;
        }
        return temp;
    }

</script>
<script type="text/javascript" src="/resources/login_register/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/login_register/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/resources/login_register/js/jquery.form.js"></script>



</body>










</html>
