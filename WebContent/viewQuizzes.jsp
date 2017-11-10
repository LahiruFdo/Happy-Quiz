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
</head>
	
	
<body>
	
    <div id="wrapper">

        <!-- Navigation -->
        <jsp:include page="header-nav.jsp">
		    <jsp:param name="active_page" value="quizzes" />
		</jsp:include>
        <br>
        <div class="container" style="background-color: white;">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-question-circle fa-fw" aria-hidden="true" ></i>&nbsp;&nbsp;Quizzes</h3>
                </div>
            </div>
            <div class="row">
            	<div class="col-lg-12">
	                <div class="panel panel-default">
			            <div class="panel-heading">
			                <i class="fa fa-file-text" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp; All Quizzes
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
        	</div>
        </div>
    </div>
	
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