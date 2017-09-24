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
    
    <script>
        function validateLogin(){
            
            var username = document.getElementById("quizname").value;
            var password = document.getElementById("password").value;

            if((username == "") || (password == "")){
                document.getElementById("alert").innerHTML = "<div class='alert alert-danger'> <strong>*</strong> Invalid Quiz name or key</div>";
                return false;
            }

            return true;
        }
    </script>
</head>

<body>
	<center>
		<br><br><br><br>
		<div class="circle">
			<h1>Start Quiz !</h1>
			<div class="panel-body" style="width:80%;">
            	<form role="form" action='EnterQuiz' method="POST" onsubmit="return validateLogin();" >
                	<fieldset>
                    	<div class="form-group">
                        	<input class="form-control" placeholder="Quiz Name" id="quizname" name="quizname" type="text" style="text-align:center;">
                    	</div>
                        <div class="form-group">
                        	<input class="form-control" placeholder="Key" id="password" name="password" type="password" value="" style="text-align:center;">
                       	</div>
                        <button class="btn btn-lg btn-success btn-block" type="submit" style="width:50%;">Enter</button>
                        <br>
                        <div id="alert"></div>
                        <a href="" class="link">Sign In</a>
                        <strong class="link">|</strong>
                        <a href="register.jsp" class="link">Register</a>
					</fieldset>
				</form>
			</div>
		</div>
	</center>
</body>

</html>