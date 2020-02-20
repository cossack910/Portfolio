function rev_check(){
    var good_review = document.getElementById("good_review"); 
    var bad_review = document.getElementById("bad_review"); 
    if (good_review.value == "" || bad_review.value == "" || good_review.value.length < 20|| bad_review.value.length < 20){
        alert('良い点も悪い点どちらも２０文字以上入力してください。');
        return false;    //送信ボタン本来の動作をキャンセルします
    }else{
        return true;    //送信ボタン本来の動作を実行します
    }
}

export default rev_check;
