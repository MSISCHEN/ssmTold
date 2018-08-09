function confirmDelete() {
    var msg="您确定要删除吗？";
    if (confirm(msg)==true){
        return true;
    }else{
        return false;
    }
}

//删除文章
function deleteArticle(id) {
    if (confirmDelete()){
        $.ajax({
            async:false,
            type:"post",
            url:"/article/deleteArticleById/"+id,
            dataType:"text",
            complete:function () {
                window.location.reload();
            }
        })
    }
}

function confirmCancel() {
    var msg="您确定要取消收藏吗？";
    if (confirm(msg)==true){
        return true;
    }else{
        return false;
    }
}
//取消收藏
function cancelCollection(articleId){
    if (confirmCancel()){
        $.ajax({
            async:false,
            type:"post",
            url:"/collection/deleteCollection/"+articleId,
            dataType:"text",
            complete:function () {
                window.location.reload();
            }
        })
    }
}


