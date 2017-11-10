<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import = "java.io.*,java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title>Happy Quiz</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"/>
	<link type="text/css" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/CSS/metisMenu.min.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/CSS/morris.min.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/CSS/sb-admin-2.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/CSS/custom.css" rel="stylesheet"/>
</head>
	
	
<body>	
    <div id="wrapper">
    	<jsp:include page="header-nav.jsp">
		    <jsp:param name="active_page" value="" />
		</jsp:include>
		<br>
		<div class="container" style="background-color: white;">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-file" aria-hidden="true"></i>&nbsp;&nbsp;New Quiz</h3>
                </div>
            </div>
            <div id="section1"> 
	            <div class="row">
	                <div class="col-sm-10 col-sm-offset-1">
	                    <div class="panel panel-default">
	                        <div class="alert alert-warning">
	                            Fill the following details first
	                        </div>
	                        <div class="panel-body" style="padding-left:5%; padding-right:5%;">
	                            <div class="row">
	                                <div class="center">
	                                    <form role="form" name="init_details" action="InitiateQuiz" onsubmit="return validate_init_details();" method="post">
	                                    	<div class="col-sm-4" style="font-size: 0.9em;">
		                                        <div class="form-group col-sm-12">
		                                            <label>Quiz Name</label>
		                                            <input class="form-control" id="quiz-name" name="quiz-name" placeholder="">
		                                            <div id="name-alert"></div>
		                                            <p class="help-block" style="font-size:0.8em;">* Any name with less than three words</p>
		                                        </div>
		                                        <div class="form-group col-sm-12">
		                                            <label>Key</label>
		                                            <input class="form-control col-sm-6" id="key" name="key" placeholder="">
		                                            <div id="key-alert"></div>
		                                            <p class="help-block" style="font-size:0.8em;">* should be between 4 to 10 characters</p>                                            
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-6" style="font-size: 0.9em;">
		                                        <div class="form-group col-sm-8">
		                                            <label>No. of Questions/Problems</label>
		                                            <input class="form-control" id="noq" name="noq"placeholder="">
		                                            <div id="noq-alert"></div>
		                                            <p class="help-block" style="font-size:0.8em;">* You can edit the number later</p>                                            
		                                        </div>                                   
		                                        <div class="form-group col-sm-6">
		                                            <label style="font-size: 0.9em;">No. Questions per page&nbsp;&nbsp;&nbsp;&nbsp;</label>
		                                            <select class='form-control opTags' id='nqp' name='nqp'>
			                                            	<option>1</option>
			                                            	<option>2</option>
			                                            	<option>3</option>
			                                            	<option>4</option>
			                                            	<option>5</option>
			                                            	<option>10</option>
			                                            	<option>All</option>
			                                        </select>
			                                        <div id="nqp-alert" value=""></div>                                          
		                                        </div>
		                                        <div class="form-group col-sm-6">
		                                            <label style="font-size: 0.9em;">No. answers per a question</label>
		                                            <select class='form-control opTags' id='apq' name='apq'>
			                                            	<option>2</option>
			                                            	<option>4</option>
			                                            	<option>5</option>
			                                        </select>
			                                        <div id="apq-alert" value=""></div>  
		                                            <p class="help-block" style="font-size:0.8em;">* You can edit the number later</p>                                            
		                                        </div> 
	                                        </div>
		                                   	<div class="form-group col-sm-11"><br>
		                                        <button type="submit" class="btn btn-success" style="background-color:#16a085; float:right;">Register</button>
		                                    </div>
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
  	</div>
  	
  	
  	<script>
  		var quizname;
  		var key;
  		var noq;
  		var nqp;
  		var apq;
  		
  		function validate_init_details(){
  			var valid = true;
  			var qnamePattern = /^[a-z A-Z]+$/;
  			
  			quizname = document.getElementById("quiz-name").value;
  			key = document.getElementById("key").value;
  			noq = document.getElementById("noq").value;
  			nqp = document.getElementById("nqp").value;
  			apq = document.getElementById("apq").value;
  			
  			if(!checkEmpty(quizname)){
  				document.getElementById("name-alert").innerHTML = "<div class='alert-danger'> <strong>*</strong> Invalid Quiz name</div>";
  				valid = false;
  			}
  			else if(!quizname.match(qnamePattern)){
  				document.getElementById("name-alert").innerHTML = "<div class='alert-danger'> <strong>*</strong> Invalid Quiz name</div>";
  				valid = false;
  			}
			if(!checkEmpty(key)){
				document.getElementById("key-alert").innerHTML = "<div class='alert-danger'> <strong>*</strong> Key cannot be empty</div>";
				valid = false;			
  			}
			else if(key.length<4 || key.length>9){
				document.getElementById("key-alert").innerHTML = "<div class='alert-danger'> <strong>*</strong> Length of your key is not allowed</div>";
				valid = false;
			}
			if(!checkEmpty(noq)){
				document.getElementById("noq-alert").innerHTML = "<div class='alert-danger'> <strong>*</strong> Invalid input</div>";
				valid = false;
  			}
			if(!checkEmpty(nqp)){
				document.getElementById("nqp-alert").innerHTML = "<div class='alert-danger'> <strong>*</strong> Invalid input</div>";
				valid = false;
  			}
			if(!checkEmpty(apq)){
				document.getElementById("apq-alert").innerHTML = "<div class='alert-danger'> <strong>*</strong> Invalid input</div>";
				valid = false;
  			}
  			if(!valid){
  				return false;
  			}
  		}
  		
  		function checkEmpty(entity){
  			if(entity == ""){
  				return false;
  			}
  			return true;
  		}
  	
  	</script>
  	
  	
  	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/JS/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/JS/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/JS/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="${pageContext.request.contextPath}/JS/vendor/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/JS/vendor/morrisjs/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/JS/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/JS/dist/js/sb-admin-2.js"></script>
    
  	
</body>

</html>