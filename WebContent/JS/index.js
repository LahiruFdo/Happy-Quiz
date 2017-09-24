
function validateLogin(){
    alert("OK got here");
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
   
    var unameAlert = document.getElementById("uname-alert");
    var pwAlert = document.getElementById("pw-alert");

    if((username == "") && (password == "")){
        document.getElementById("uname-alert").innerHTML = "<div class='alert alert-danger'> <strong>*</strong> Invalid Username</div>";
        return false;
    }

    else if(username == ""){
        document.getElementById("uname-alert").innerHTML = "<div class='alert alert-danger'> <strong>*</strong> Invalid Username</div>";
        return false;
    }

    else if(password == ""){
        document.getElementById("pw-alert").innerHTML = "<div class='alert alert-danger'> <strong>*</strong> Invalid Password</div>";
        return false;
    }

    return true;	
}


