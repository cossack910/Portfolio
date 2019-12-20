function check(){
    var user_name_add = document.getElementById("user_name_add"); 
    var last_name_add = document.getElementById("last_name_add"); 
    var first_name_add = document.getElementById("first_name_add"); 
    var birthday_add = document.getElementById("birthday_add"); 
    var mail_add1 = document.getElementById("mail_add1"); 
    var mail_add2 = document.getElementById("mail_add2"); 
    var pass_add1 = document.getElementById("pass_add1");
    var pass_add2 = document.getElementById("pass_add2");  
    if (user_name_add.value == "" || last_name_add.value == "" || first_name_add.value == "" || birthday_add.value == "" || mail_add1.value == "" || mail_add2.value == "" || pass_add1.value == "" || pass_add2.value == "" || mail_add1.value != mail_add2.value || pass_add1.value != pass_add2.value || pass_add1.value.length <= 7|| pass_add2.value.length <= 7){
        if(user_name_add.value == "" ){
            document.getElementById("miss_user_name").textContent = "※ユーザー名が空です。";
        }
        if(last_name_add.value == "" ){
            document.getElementById("miss_last_name").textContent = "※姓が空です。";
        }
        if(first_name_add.value == "" ){
            document.getElementById("miss_first_name").textContent = "※名が空です。";
        }
        if(birthday_add.value == "" ){
            document.getElementById("miss_birthday").textContent = "※生年月日が空です。";
        }
        if(mail_add1.value == "" ){
            document.getElementById("miss_mail1").textContent = "※メールアドレスが空です。";
        }
        if(mail_add2.value == "" ){
            document.getElementById("miss_mail2").textContent = "※メールアドレス確認が空です。";
        }
        if(pass_add1.value == "" ){
            document.getElementById("miss_pass1").textContent = "※パスワードが空です。";
        }
        if(pass_add2.value == "" ){
            document.getElementById("miss_pass2").textContent = "※パスワード確認が空です。";
        }
        if(pass_add1.value.length <= 7 ){
            document.getElementById("miss_pass1").textContent = "※パスワードは８文字以上です。";
        }
        if(pass_add2.value.length <= 7 ){
            document.getElementById("miss_pass2").textContent = "※パスワードは８文字以上です。";
        }

        alert('入力間違えです。');
        return false;    //送信ボタン本来の動作をキャンセルします
    }else{
        return true;    //送信ボタン本来の動作を実行します
    }
}

export default check;
