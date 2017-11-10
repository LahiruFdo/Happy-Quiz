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
	
	<%
		String[] quizDetails = (String[])request.getAttribute("quizDetails");
	
		String refNo = quizDetails[0];
		String name = quizDetails[1];
		String quiz_key = quizDetails[2];
		String quizSet = quizDetails[3];
		String created_date = quizDetails[4];
		String last_edited_date = quizDetails[5];
		String activation = quizDetails[6];
		if(activation.equals("0")){
			activation = "Deativated";
		}
		else{
			activation = "Activated";
		}
		int creator_id = Integer.parseInt(quizDetails[7]);
	%>
	
<body>	
    <div id="wrapper">
    	<jsp:include page="header-nav.jsp">
		    <jsp:param name="active_page" value="" />
		</jsp:include>
		<br>
		<div class="container" style="background-color: white;">
			<div class="row">
                <div class="col-lg-12">
                	<div class="page-header">
                    	<h3><i class="fa fa-file" aria-hidden="true"></i>&nbsp;&nbsp;Quiz 1</h3>
		           	</div>
		           	<%
		           	if(quizSet == null){
		           		out.write("<div class='col-lg-12 alert alert-warning' style='float:right;'>"+
			           				"<p><span class='h4'>Warning !!!</span>&nbsp;&nbsp;&nbsp;&nbsp;- This quiz is not containing any question yet. You need to edit this quiz&nbsp;&nbsp;&nbsp;&nbsp;"+
		               				"<span><button class='btn btn-warning' href='#'>Edit Quiz</button></span>"+
		               				"</p>"+
		           					"</div>");
		           	}
		           	%>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
						<thead>
                        	<tr>
                            	<th>Reference No.</th>
                          		<th>Key</th>
                          		<th>Created Date</th>
                               	<th>Last Edited Date</th>
                               	<th>Activation</th>
                         	</tr>
                    	</thead>
                        <tbody>
                        	<tr class="odd gradeX">
                            	<td><%= refNo %></td>
                            	<td><%= quiz_key %></td>
                                <td><%= created_date %></td>
                                <td><%= last_edited_date %></td>
                                <td><%= activation %></td>
                         	</tr>
                      	</tbody>
             		</table>
                            <!-- /.table-responsive -->
                 	<span style="float:right; margin-right: 1em;">
                  		<a class="btn btn-warning" href="EditQuiz1?id=<%= refNo%>">Edit</a>&nbsp;
                   		<button class="btn btn-danger">Delete</button>&nbsp;
                   		<a class="btn btn-info">Preview</a>&nbsp;
                   		<%
                   		if(activation.equals("0")){
                   			out.write("<button class='btn btn-success'>Activate</button>&nbsp;");
                   		}
                   		else{
                   			out.write("<button class='btn btn-primary'>Deactivate</button>&nbsp;");
                   		}
                   		%>                 		
                   	</span>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <br><br>
			
           	
		</div>
	</div>
</body>

</html>