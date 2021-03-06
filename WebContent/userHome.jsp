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
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
	<link type="text/css" href="${pageContext.request.contextPath}/CSS/bootstrap.min.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/CSS/metisMenu.min.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/CSS/morris.min.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/CSS/sb-admin-2.css" rel="stylesheet"/>
    <link type="text/css" href="${pageContext.request.contextPath}/CSS/custom.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
	
	
<body>
	
    <div id="wrapper">

        <!-- Navigation -->
        <jsp:include page="header-nav.jsp">
		    <jsp:param name="active_page" value="home" />
		</jsp:include>
        <br>
        
        <div class="container" style="background-color: white;">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-home"></i>&nbsp;&nbsp;Home</h3>
                </div>
            </div>
            <div class="row">
            	<div class="col-lg-12">
	                <div class="col-sm-8">
	                	<div class="panel panel-default">
			            	<div class="panel-heading">
			                	<i class="fa fa-file-text" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp; Quiz Summary
			           		</div>
			                <div class="panel-body">
			                	<div class="list-group">
			                                <!-- <a href="#" class="list-group-item">
			                                    <i class="fa fa-comment fa-fw"></i> New Comment
			                                    <span class="pull-right text-muted small"><em>4 minutes ago</em>
			                                    </span>
			                                </a> -->
			                		<h5><i>No any quiz yet...</i></h5>
			                	</div>
			        		</div>
			     		</div>
	               	</div>
	               	<div class="col-sm-4">
	               		<center>
	                	<a type="button" href="addQuiz.jsp" class="btn btn-lg btn-success" style="background-color:#16a085;">Add New Quiz</a>
	                	</center>
	                </div>
	        	</div>
        	</div>
        </div>
        
    </div>

</body>

</html>