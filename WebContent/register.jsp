<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title>Happy Quiz</title>
	
	<link type="text/css" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/CSS/font-awesome.min.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/CSS/metisMenu.min.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/CSS/morris.min.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/CSS/sb-admin-2.css" rel="stylesheet"/>
</head>
	
<body>
	<div id="wrapper">
		<!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">Happy Quiz</a>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <h3 class="page-header">Welcome to Happy Quiz</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <div class="panel panel-default">
                        <div class="alert alert-success">
                            Register as a new user
                        </div>
                        <div class="panel-body" style="padding-left:10%; padding-right:10%;">
                            <div class="row">
                                <div class="center">
                                    <form role="form" name="register" action="Register" onsubmit="return validateForm();" method="post">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input class="form-control" name="name" placeholder="Enter your name">
                                            <div id="name-alert"></div>
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input class="form-control" name="email" placeholder="Enter your email">
                                            <div id="email-alert"></div>
                                            <p class="help-block">email@example.com</p>                                            
                                        </div>                                        
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input class="form-control" name="username" placeholder="Enter a username" onfocusout="sendInfo()">
                                            <div id="uname-alert" value=""></div>
                                            <p class="help-block">You Need to have a unique username</p>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input class="form-control" name="pw" placeholder="Enter a password" type="password">
                                            <div id="pw-alert"></div>
                                        </div>
                                        <div class="form-group">
                                            <label>Confirm Password</label>
                                            <input class="form-control" name="pw-r" placeholder="Re-Enter your password" type="password">
                                            <div id="pw1-alert"></div>
                                        </div>
                                        <center>
                                        	<button type="submit" class="btn btn-success">Let me Register</button>
                                        </center>
                                    </form>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
	</div>
	
	<script>
		function validateForm() {
			var value = true;
			var letterNumber = /^[a-z A-Z]+$/;  
			
		    var email = document.forms["register"]["email"].value;
		    var atpos = email.indexOf("@");
		    var dotpos = email.lastIndexOf(".");
		    if (atpos<1 || dotpos<atpos+2 || dotpos+2 >= email.length) {
		    	document.getElementById("email-alert").innerHTML = "<div class='alert-danger'><center><strong>*</strong> Invalid Email</center></div>";
		        value = false;
		    }
		    
		    var name = document.forms["register"]["name"].value;		    
		    if(name.match(letterNumber))   
		     {  
		     } 
		    else if (name == "") {
		    	document.getElementById("name-alert").innerHTML = "<div class='alert-danger'><center><strong>*</strong> Cannot be empty</center></div>";
		        value = false;
		    }		    
		    else{
		    	document.getElementById("name-alert").innerHTML = "<div class='alert-danger'><center><strong>*</strong> Invalid type of name</center></div>";
		     	value =  false;  
		    }
		    
		    var username = document.forms["register"]["username"].value;		    
		    if (username == "") {
		    	document.getElementById("uname-alert").innerHTML = "<div class='alert-danger'><center><strong>*</strong> Cannot be empty</center></div>";
		        value = false;
		    }
		    
		    var pw = document.forms["register"]["pw"].value;
		    var pwr = document.forms["register"]["pw-r"].value;
		    
		    if(pw != pwr){
		    	document.getElementById("pw1-alert").innerHTML = "<div class='alert-danger'><center><strong>*</strong> Passwords do not match</center></div>";
		    	document.getElementById("pw-alert").innerHTML = "<div class='alert-danger'><center><strong>*</strong> Passwords do not match</center></div>";
		    	value = false;
		    }
		    
		    else if (pw == "") {
		    	document.getElementById("pw-alert").innerHTML = "<div class='alert-danger'><center><strong>*</strong> Cannot be empty</center></div>";
		        value = false;
		    }
		    
		    
		    if (pwr == "") {
		    	document.getElementById("pw1-alert").innerHTML = "<div class='alert-danger'><center><strong>*</strong> Cannot be empty</center></div>";
		        value = false;
		    }		    
		    
		    var unameError = document.getElementById("uname-alert").value;
		    if(unameError!=""){
		    	value = false;
		    }
		    
		    if(value == false){
		    	return false;
		    }
		    return true;
		}
		
		var request;  
		function sendInfo()  
		{  
			var v=document.forms["register"]["username"].value;
			//alert(v);
			var url="CheckUsername?val="+v;  
			var request = new XMLHttpRequest();
			
			request.onreadystatechange = function(){
				if(request.readyState == 4 && request.status == 200){
					var out = request.responseText;
				}
				
				if(out!=""){
					document.getElementById("uname-alert").innerHTML = "<div class='alert-danger'><center><strong>*</strong>"+out+"</center></div>";
					document.getElementById("uname-alert").value = "error";
				}
				else{
					document.getElementById("uname-alert").innerHTML = "";
					document.getElementById("uname-alert").value = "";
				}
				
			};
			request.open("GET",url,true);
			request.send(null);
				
		}
			
	</script>
	
</body>
</html>