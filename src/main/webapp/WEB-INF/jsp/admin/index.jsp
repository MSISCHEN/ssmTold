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
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <%--<link rel="stylesheet" type="text/css" href="/resources/login_register/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/simple-line-icons.css">
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/fullcalendar.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/style.css">--%>
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/easyui.css">
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/icon.css">
    <link rel="stylesheet" type="text/css" href="/resources/login_register/css/demo.css">
    <script type="text/javascript" src="/resources/login_register/js/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/login_register/js/jquery.easyui.min.js"></script>
    <%--<script type="text/javascript" src="/resources/login_register/js/jquery.easyui.min.js"></script>--%>

</head>
<body>

<div style="margin:10px 0;"></div>
<div class="easyui-layout" style="width:100%;height:100%;">
    <div data-options="region:'north'" style="height:90px">
        <img src="/static/images/logo.gif"/>
    </div>
    <div data-options="region:'south',split:true" style="height:50px;">
        <span>@copy amini</span>

    </div>
    <div data-options="region:'west',split:true" title="后台管理" style="width:200px;">
        <div class="easyui-accordion" data-options="fit:true,border:false">
            <div title="文章" style="padding:10px;">
                <ul>
                    <li><a href="#" class="easyui-linkbutton" onclick="addTab('全部文章','/admin/articleList')">文章管理</a></li>
                </ul>
            </div>
            <div title="Title2" data-options="selected:true" style="padding:10px;">
                content2
            </div>
            <div title="Title3" style="padding:10px">
                content3
            </div>
        </div>

    </div>
    <div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
        <div class="easyui-tabs" id="tt" data-options="fit:true,border:false,plain:true">
            <div title="About" data-options="href:'admin/articleList'" style="padding:10px"></div>
            <div title="DataGrid" style="padding:5px">
                <table class="easyui-datagrid"
                       data-options="url:'datagrid_data1.json',method:'get',singleSelect:true,fit:true,fitColumns:true">
                    <thead>
                    <tr>
                        <th data-options="field:'itemid'" width="80">Item ID</th>
                        <th data-options="field:'productid'" width="100">Product ID</th>
                        <th data-options="field:'listprice',align:'right'" width="80">List Price</th>
                        <th data-options="field:'unitcost',align:'right'" width="80">Unit Cost</th>
                        <th data-options="field:'attr1'" width="150">Attribute</th>
                        <th data-options="field:'status',align:'center'" width="50">Status</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

<h2>Basic Layout</h2>
<p>The layout contains north,south,west,east and center regions.</p>
<div style="margin:20px 0;"></div>
<div class="easyui-layout" style="width:700px;height:350px;">
    <div data-options="region:'north'" style="height:50px"></div>
    <div data-options="region:'south',split:true" style="height:50px;"></div>
    <div data-options="region:'east',split:true" title="East" style="width:100px;"></div>
    <div data-options="region:'west',split:true" title="West" style="width:100px;"></div>
    <div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
        <table class="easyui-datagrid"
               data-options="url:'datagrid_data1.json',method:'get',border:false,singleSelect:true,fit:true,fitColumns:true">
            <thead>
            <tr>
                <th data-options="field:'itemid'" width="80">Item ID</th>
                <th data-options="field:'productid'" width="100">Product ID</th>
                <th data-options="field:'listprice',align:'right'" width="80">List Price</th>
                <th data-options="field:'unitcost',align:'right'" width="80">Unit Cost</th>
                <th data-options="field:'attr1'" width="150">Attribute</th>
                <th data-options="field:'status',align:'center'" width="60">Status</th>
            </tr>
            </thead>
        </table>
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

</script>




</body>





<%--<body id="mimin" class="dashboard">
<!-- start: Header -->
<nav class="navbar navbar-default header navbar-fixed-top">
    <div class="col-md-12 nav-wrapper">
        <div class="navbar-header" style="width:100%;">
            <div class="opener-left-menu is-open"> <span class="top"></span> <span class="middle"></span> <span class="bottom"></span> </div>
            <a href="index.html" class="navbar-brand"> <b>12</b> </a>
            <ul class="nav navbar-nav navbar-right user-nav">
                <li class="user-name"><span>xxxxx</span></li>
                <li class="dropdown avatar-dropdown"> <img src="/resources/login_register/css/icons/avatar.jpg" class="img-circle avatar" alt="user name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"/>
                    <ul class="dropdown-menu user-dropdown">
                        <li><a href="#"><span class="fa fa-power-off"></span> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- end: Header -->
<div class="container-fluid mimin-wrapper">
    <!-- start:Left Menu -->
    <div id="left-menu">
        <div class="sub-left-menu scroll">
            <ul class="nav nav-list">
                <li>
                    <div class="left-bg"></div>
                </li>
                <li class="active ripple"> <a class="tree-toggle nav-header"><span class="fa-home fa"></span> 首页 <span class="fa-angle-right fa right-arrow text-right"></span> </a> </li>
                <li class="ripple"> <a class="tree-toggle nav-header"> <span class="fa-diamond fa"></span> 表单 <span class="fa-angle-right fa right-arrow text-right"></span> </a>
                    <ul class="nav nav-list tree">
                        <li><a href="/admin/articleList">列表</a></li>
                        <li><a href="edit.html">编辑</a></li>
                    </ul>
                </li>
                <li class=" ripple"> <a class="tree-toggle nav-header"><span class="fa fa-check-square-o"></span> 首页 <span class="fa-angle-right fa right-arrow text-right"></span> </a> </li>
                <li class=" ripple"> <a class="tree-toggle nav-header"><span class="fa fa-calendar-o"></span> 首页 <span class="fa-angle-right fa right-arrow text-right"></span> </a> </li>
            </ul>
        </div>
    </div>
    <!-- end: Left Menu -->

    <!-- start: content -->
    <div id="content">
        <div class="panel">
            <div class="panel-body">
                <div class="col-md-6 col-sm-12">
                    <h3 class="animated fadeInLeft">欢迎您：xxxxx</h3>
                    <p class="animated fadeInDown"><span class="fa  fa-map-marker"></span> 管理员</p>
                </div>
            </div>
        </div>
        <div class="col-md-12" style="padding:20px;">
            <div class="col-md-12 padding-0">
                <div class="col-md-8 padding-0">
                    <div class="col-md-12 padding-0">
                        <div class="col-md-6">
                            <div class="panel box-v1">
                                <div class="panel-heading bg-white border-none">
                                    <div class="col-md-6 col-sm-6 col-xs-6 text-left padding-0">
                                        <h4 class="text-left">待办事项</h4>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                                        <h4> <span class="icon-user icons icon text-right"></span> </h4>
                                    </div>
                                </div>
                                <div class="panel-body text-center">
                                    <ul class="normal-list">
                                        <li class="text-left"><span class="right">2017-11-18</span><a href="#"><span class="fa fa-angle-right"></span> 通知公告列表文字</a></li>
                                        <li class="text-left"><span class="right">2017-11-18</span><a href="#"><span class="fa fa-angle-right"></span> 通知公告列表文字</a></li>
                                        <li class="text-left"><span class="right">2017-11-18</span><a href="#"><span class="fa fa-angle-right"></span> 通知公告列表文字</a></li>
                                    </ul>
                                    <p><a href="#">更多信息</a></p>
                                    <hr/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel box-v1">
                                <div class="panel-heading bg-white border-none">
                                    <div class="col-md-6 col-sm-6 col-xs-6 text-left padding-0">
                                        <h4 class="text-left">通知公告</h4>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                                        <h4> <span class="icon-check icons icon text-right"></span> </h4>
                                    </div>
                                </div>
                                <div class="panel-body text-center">
                                    <ul class="normal-list">
                                        <li class="text-left"><span class="right">2017-11-18</span><a href="#"><span class="fa fa-angle-right"></span> 通知公告列表文字</a></li>
                                        <li class="text-left"><span class="right">2017-11-18</span><a href="#"><span class="fa fa-angle-right"></span> 通知公告列表文字</a></li>
                                        <li class="text-left"><span class="right">2017-11-18</span><a href="#"><span class="fa fa-angle-right"></span> 通知公告列表文字</a></li>
                                    </ul>
                                    <p><a href="#">更多信息</a></p>
                                    <hr/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="col-md-12 padding-0">
                        <div class="panel box-v2">
                            <div class="panel-heading padding-0"> <img src="/resources/login_register/css/icons/bg2.jpg" class="box-v2-cover img-responsive"/>
                                <div class="box-v2-detail"> <img src="/resources/login_register/css/icons/avatar.jpg" class="img-responsive"/>
                                    <h4>xxxxx</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="col-md-12 padding-0 text-center">
                                    <div class="col-md-4 col-sm-4 col-xs-6 padding-0">
                                        <h3>2000</h3>
                                        <p>待处理</p>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-6 padding-0">
                                        <h3>1000</h3>
                                        <p>已处理</p>
                                    </div>
                                    <div class="col-md-4 col-sm-4 col-xs-6 padding-0">
                                        <h3>1000</h3>
                                        <p>已过期</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end: content -->

    <div id="articleList" style="display: none">


    </div>

</div>

<!-- start: Javascript -->
<script type="text/javascript" src="/resources/login_register/js/jquery.min.js"></script>
<script src="/resources/login_register/js/jquery.ui.min.js"></script>
<script src="/resources/login_register/js/bootstrap.js"></script>
<script type="text/javascript" src="/resources/login_register/js/jquery.easyui.min.js"></script>
<!-- plugins -->
<script src="/resources/login_register/js/jquery.nicescroll.js"></script>
<!-- custom -->
<script src="/resources/login_register/js/main.js"></script>
<!-- end: Javascript -->


<script>
   /* $("#articleListVo").click(function () {
        $.ajax({
            url:"/admin/articleList",
            type:"post",
            dataType:"json",
            success:function(result){

            }
        });
    })*/

</script>
</body>--%>




</html>
