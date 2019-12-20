function mailcheck(){
    var mail_add1 = document.getElementById("mail_add1"); 
    var mail_add2 = document.getElementById("mail_add2"); 
    if(mail_add1.value == ""){
        document.getElementById("miss_mail2").textContent = "※メールアドレスが空です。";
    }
    if(mail_add1.value != mail_add2.value){ 
        document.getElementById("miss_mail2").textContent = "※メールアドレスと違います。";
    }
}

export default mailcheck;
