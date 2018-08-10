<%--
  Created by IntelliJ IDEA.
  User: amini
  Date: 2018/8/2
  Time: 1:57
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

</head>
<body>
<table id="t" class="easyui-datagrid"
       data-options="url:'datagrid_data1.json',method:'get',border:false,singleSelect:true,fit:true,fitColumns:true">
    <thead>
    <tr>
<%--
        <th field="check"><input type="checkbox" name="allSel"/>全选</th>
--%>
        <th field="num"> 序号</th>
        <th field="articleTitle"> 文章标题</th>
        <th field="userName">发布者</th>
        <th field="articleUpdateTime">文章更新时间</th>
        <th field="collectionNum">收藏数</th>
        <th field="commentNum">评论数</th>
        <th field="articleLikeNum">点赞数</th>
        <th field="articleStatus">文章状态</th>
        <th field="work">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:set value="0" var="temp"/>
    <c:forEach items="${articleListVoList}" var="a">


    <tr>
        <c:set var="temp" value="${temp+1}"/>
        <td>
            ${temp}
        </td>
        <%--<td><input type="checkbox" name="select" value="${a.articleCustom.articleId}"></td>--%>
        <td>${a.articleCustom.articleTitle}</td>
        <td>${a.userCustom.name}</td>
        <td><fmt:formatDate value="${a.articleCustom.articleUpdateTime}" pattern="yyyy年MM月dd日 HH:mm"/></td>
        <td>${a.articleCustom.collectionNum}</td>
        <td>${a.articleCustom.commentNum}</td>
        <td>${a.articleCustom.articleLikeNum}</td>
        <td id="status">
            <c:if test="${a.articleCustom.articleStatus==0}">审核中</c:if>
            <c:if test="${a.articleCustom.articleStatus==1}">发布成功</c:if>
            <c:if test="${a.articleCustom.articleStatus==2}">驳回审核</c:if>
            <c:if test="${a.articleCustom.articleStatus==3}">推荐中<span style="color: red">*</span> </c:if>

        </td>
        <td>
            <a href="javascript:void(0)" class="easyui-linkbutton pass" onclick="updateStatus(${a.articleCustom.articleId},1,${temp-1});">审核通过</a>
            <a href="#" class="easyui-linkbutton dispass" onclick="updateStatus(${a.articleCustom.articleId},2,${temp-1});">驳回审核</a>
            <a href="#" class="easyui-linkbutton dispass" onclick="updateStatus(${a.articleCustom.articleId},3,${temp-1});">推荐此文章</a>
        </td>
    </tr>
    </c:forEach>

    </tbody>

</table>



</body>
<script>
    function updateStatus(articleId,articleStatus,temp) {
        $.ajax({
            url:"/admin/updateStatus",
            type:"post",
            data:{"articleId":articleId,"articleStatus":articleStatus},
            success:function(){
                if (articleStatus==1){

                    $(".pass:eq("+temp+")").parent().parent('td').prev().find('div').html("发布成功");
                }else if (articleStatus==2){
                    $(".pass:eq("+temp+")").parent().parent('td').prev().find('div').html("驳回审核");
                }
                else{
                    $(".pass:eq("+temp+")").parent().parent('td').prev().find('div').html("推荐中<span style=\"color:red\">*</span>");
                }
            },
            error:function () {

                if (articleStatus==1){

                    $(".pass:eq("+temp+")").parent().parent('td').prev().find('div').html("发布成功");
                }else if (articleStatus==2){
                    $(".pass:eq("+temp+")").parent().parent('td').prev().find('div').html("驳回审核");
                }
                else{
                    $(".pass:eq("+temp+")").parent().parent('td').prev().find('div').html("推荐中<span style=\"color:red\">*</span>");
                }
            }
        });
    }

    $("[name='allSel']").click(function () {
        alert("点击");
        if($(this).is(':checked')){
            $("[name='select']").attr('checked',true);
        }else{
            $("[name='select']").attr('checked',false);

        }
    })

    $("[name='select']").click(function () {
        var allSel=false;
        $("[name='select']").each(function () {
            if(!$(this).is(':checked')){
                allSel=true;
            }
        })
        if(allSel){
            $("[name='allSel']").attr('checked',false);
        }else{
            $("[name='allSel']").attr('checked',true);
        }
    })


</script>
</html>
