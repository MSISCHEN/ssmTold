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
    alert("点击");
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
    alert("点击");
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

/*function openEditor(){
    showEditorForm();
    setTimeout(function(){
        $('#loginModal').modal('show');
    }, 230);

}

function showEditorForm(){
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');
        });

        $('.modal-title').html('Login with');
    });
    $('#error').removeClass('alert alert-danger').html('');
}*/

//点击收藏列表
/*
$("#collection").click(function () {

})*/
