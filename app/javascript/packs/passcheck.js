function passcheck(){
    var pass_add1 = document.getElementById("pass_add1"); 
    var pass_add2 = document.getElementById("pass_add2"); 
    if(pass_add1.value == ""){
        document.getElementById("miss_pass2").textContent = "※パスワードが空です。";
    }
    if(pass_add1.value != pass_add2.value){ 
        document.getElementById("miss_pass2").textContent = "※パスワードと違います。";
    }
}

export default passcheck;
