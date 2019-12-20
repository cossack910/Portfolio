function passlength(){
    var pass_add1 = document.getElementById("pass_add1"); 
    if(pass_add1.value.length <= 7){
        document.getElementById("miss_pass1").textContent = "※パスワードは8文字以上です。";
    }
}

export default passlength;
