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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
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
        
		function validateSignIn(){            
            var username = document.getElementById("username").value;
            var password = document.getElementById("pw").value;

            if((username == "") || (password == "")){
                document.getElementById("signIn-alert").innerHTML = "<div class='alert alert-danger'> <strong>*</strong> Invalid username or password</div>";
                return false;
            }

            return true;
        }
    </script>
</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
	<%
		HttpSession session1 = request.getSession(false);
		/* if (session1 == null) {
			session1.invalidate();
		} */
		if (session1 != null) {
			session1.invalidate();
		}
		
		String error = (String)request.getAttribute("error"); 
		if(error == null || error == ""){
			error = "";
		}
	%>
	<center>
		<br><br>
		<%
			if(error != ""){
				out.write("<div class='col-sm-4 col-sm-offset-4'><div class='alert alert-danger'> <strong>*</strong>"+error+"</div></div><br><br><br>");
			}
		%>
		<br><br>
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
                        <a data-toggle="modal" data-target="#myModal" class="link" style="cursor:pointer;">Sign In</a>
                        <strong class="link">|</strong>
                        <a href="register.jsp" class="link">Register</a>
					</fieldset>
				</form>
			</div>
		</div>
	</center>

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
	  	<div class="modal-dialog" style="width:30%;">
	
	    <!-- Modal content-->
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal">&times;</button>
	        		<h4 class="modal-title">Please Sign In</h4>
	      		</div>
	      		<div class="modal-body">
	      			<fieldset>
	      			<form role="form" action='Authentication' method="POST" onsubmit="return validateSignIn();" >
	      				<div class="form-group">
                        	<input class="form-control" id="username" placeholder="Username" name="username" type="text" autofocus>
                        </div>
                        <div class="form-group">
                        	<input class="form-control" id="pw" placeholder="Password" name="password" type="password" value="">
                       	</div>
                       	<div id="signIn-alert"></div>
                       	<button type="submit" class="btn btn-lg btn-success btn-block" style="width:30%;">Sign In</button><br>
                       	<center><a href="register.jsp" class="link"><I><u>Let me Register</u></I></a></center>
                    </form>
	      			</fieldset>
	      		</div>
	    	</div>	
	  	</div>
	</div>
	
	<script type="text/javascript">
	    window.history.forward();
	    function noBack() { window.history.forward(); }
	</script>
</body>



</html>