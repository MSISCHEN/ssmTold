var articleId=$("#articleId").val();
$("#insertComment").click(function () {
    var commentContent=$("#commentContent").val();
    $("#commentContent").val("");
    var userName=$("#userName").val();
    var headImg=$("#headImg").val();
    var commentCreateTime=new Date();
    var commentPid=$("#commentPid").val();
    var commentPname=$("#commentPname").val();
    // var BlogName=$("#userCustomName").val();

    if (commentContent!=""&&articleId!=""&&userName!=""){
        $.ajax({
            url:"/comment/insertComment",
            type:"post",
            async:false,
            data:{"commentContent":commentContent,"commentArticleId":articleId,"commentAuthorName":userName,"commentAuthorHeadImg":headImg,"commentCreateTime":commentCreateTime,"commentPid":commentPid,"commentPname":commentPname},
            dataType:"text",
            success:function(commentId){
                window.location.reload();
            },
            error:function(commentId){
            }
        });
    }else{
        alert("请输入内容！");
    }
});

//回复的链接
$(".reply").click(function(){
    var authorName=$(this).parents('.rollOne').find("strong").text();
    var commentId=$(this).parents('.rollOne').find("input").attr("value");
    $("input[name=commentPid]").attr("value", commentId);
    $("input[name=commentPname]").attr("value", authorName);
    $("#commentContent").attr("placeholder", "@ " + authorName)
});



//增加收藏
function insertCollection() {
    var collectionUserId=$("#userId").val();
    var collectionNum=$('#collectionNum').html();
    if (collectionUserId!=null&&articleId!=null){
        if($("#collection").css("color")=="rgb(85, 85, 85)"){

            $.ajax({
                async:false,
                type:"post",
                url:"/collection/selectCollection",
                data:{"collectionUserId":collectionUserId,"collectionArticleId":articleId},
                dataType:"text",
                success:function (data) {
                    if(data!="") {
                        $("#collection").css("color", "green");
                        alert("已收藏");
                    }else{
                        $("#collection").css("color", "green");
                        $("#collectionNum").html(Number(collectionNum)+Number(1));
                    }
                },
                error:function (data) {
                    if(data!="") {
                        $("#collection").css("color", "green");
                        alert("已收藏");
                    }else{
                        $("#collection").css("color", "green");
                        $("#collectionNum").html(Number(collectionNum)+Number(1));
                    }

                }

            });


        }else{
            alert("已收藏");
        }
    }else{
        alert("请先登陆");
    }

}
//增加点赞
function updateArticleLikeNum(){
    if($("#articleLike").css("color")=="rgb(85, 85, 85)"){
         var articleLikeNum=$('#articleLikeNum').html();
         articleLikeNum=Number(articleLikeNum)+Number(1);
         $("#articleLike").css("color", "green");
         $.ajax({
         async:false,
         type:"post",
         url:"/article/updateArticleLikeNum/"+articleId,
         dataType:"text",
         success:function () {
             $("#articleLikeNum").html(articleLikeNum);
         },
         error:function () {
             $("#articleLikeNum").html(articleLikeNum);

         }

         });
     }else{

     }
 }
