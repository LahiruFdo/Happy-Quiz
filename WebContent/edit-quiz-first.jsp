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
    
    <script>
    	
		function nextQst(qno){		
			var c_q = document.getElementById("NoQ").value;
                        var noa = document.getElementById("NoA").value;
			var index = parseInt(qno);
		
			if(index == c_q){
				document.getElementById(index).style.display = 'none';
				document.getElementById("btn").style.display = 'none';
				document.getElementById("alert").style.display = 'block';
				document.getElementById("deleteBtn").style.display = 'none';
				document.getElementById("addBtn").style.display = 'none';
				document.getElementById("b-btn").style.display = 'none';
			}
			else{
				document.getElementById(index).style.display = 'none';
				document.getElementById(index+1).style.display = 'block';
				index++;
				document.getElementById("btn").value = index;
				document.getElementById("deleteBtn").value = index;
				document.getElementById("addBtn").value = index;
				document.getElementById("b-btn").value = index;
				
                                if(noa<5){
                                    document.getElementById("addBtn").style.display = 'block';
                                }
                                if(noa>2){
                                    document.getElementById("deleteBtn").style.display = 'block';
                                }
				if(index>1){
                                    document.getElementById("b-btn").disabled = false;
				}
			}
		}
		
		function prevQst(qno){
			var c_q = document.getElementById("NoQ").value;
			var index = parseInt(qno);
			
			document.getElementById(index).style.display = 'none';
			index--;
			document.getElementById(index).style.display = 'block';
			document.getElementById("btn").value = index;
			document.getElementById("deleteBtn").value = index;
			document.getElementById("addBtn").value = index;
			document.getElementById("b-btn").value = index;
			
			if(index==1){
				document.getElementById("b-btn").disabled = true;
			}
		}
		
		function viewAgain(){
			document.getElementById("alert").style.display = 'none';
			document.getElementById(1).style.display = 'block';
			document.getElementById("btn").value = 1;
			document.getElementById("b-btn").value = 1;
			document.getElementById("btn").style.display = 'block';
			document.getElementById("b-btn").style.display = 'block';
			document.getElementById("b-btn").disabled = true;
			document.getElementById("deleteBtn").value = 1;
			document.getElementById("addBtn").value = 1;
			document.getElementById("deleteBtn").style.display = 'block';
			document.getElementById("addBtn").style.display = 'block';
		}
		
		function deleteOpt(val){
			var ind = parseInt(val);
			var divVal = "noa-"+ind;
			var noa = document.getElementById(divVal).value;
			var noa1 = parseInt(noa);
			if(noa1>2){
				var i = ind+"-"+noa;
				var j = parseInt(noa)-1;
				document.getElementById(i).style.display = 'none';
				document.getElementById(divVal).value = j;
				if(j==2){
					document.getElementById("deleteBtn").style.display = 'none';
				}
				if(j<5){
					document.getElementById("addBtn").style.display = 'block';
				}
			}
			else{
				document.getElementById("deleteBtn").style.display = 'none';
			}
		}
		
		function addOpt(val){
			var ind = parseInt(val);
			var divVal = "noa-"+ind;
			var noa = document.getElementById(divVal).value;
			var noa1 = parseInt(noa);
			if(noa1<5){
				var i = "cont-"+ind;
				var j = parseInt(noa)+1;
				var k = ind+"-"+j;
				document.getElementById(k).style.display = 'block';
				document.getElementById(divVal).value = parseInt(noa)+1;
				if(j==5){
					document.getElementById("addBtn").style.display = 'none';
				}
				if(j>2){
					document.getElementById("deleteBtn").style.display = 'block';
				}
			}
			else{
				document.getElementById("addBtn").style.display = 'none';
			}
		}
		
	</script>
</head>
	
<%
	String quizName = (String)request.getAttribute("name");
	String refNo = (String)request.getAttribute("refNo");
	String noq = (String)request.getAttribute("noq");
	String nqp = (String)request.getAttribute("nqp");
	String apq = (String)request.getAttribute("apq");
	
	int no_of_qst = Integer.parseInt(noq);
	int no_of_ans = Integer.parseInt(apq);
	
	int ans_no;
	
	int count_prob = 1;
%>
	
<body>	
    <div id="wrapper">
    	<jsp:include page="header-nav.jsp">
		    <jsp:param name="active_page" value="" />
		</jsp:include>
		<br>
		
		<form role="form" name="register" action="AddQuizes" onsubmit="checkValidity()" method="post">
		
		<input id='NoQ' name='NoQ' value=<%= no_of_qst  %> hidden>
                <input id='NoA' name='NoA' value=<%= no_of_ans  %> hidden>
		<input id='refNo' name='refNo' value=<%= refNo  %> hidden>
		
		<div class="container" style="background-color: white;">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"><i class="fa fa-file" aria-hidden="true"></i>&nbsp;&nbsp;<%= quizName %></h3>
                </div>
            </div>
            <div class="row">
            	
            		<div class="col-sm-12" id="1" value="1">
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
	                            <strong>Question No. 1</strong>
	                        </div>
                        	<div class="panel-body">
                        		<div class="form-group">
                                	<label>Question :</label>
                                    <textarea class="form-control" rows="3" id="Question1" name="1"></textarea><br><br>
                                    <div class="container" id="cont-1">
                                    <%
                                    	for(int i=1; i<=5; i++){
                                    		ans_no = i;
                                    		if(i>no_of_ans){out.write("<div class='row' id='1-"+i+"' style='display:none;'>");}
                                    		else{out.write("<div class='row' id='1-"+i+"'>");}
                                    			out.write("<div class='col-sm-2'>");
                                    				out.write("<label style='float:right'>Option "+i+" :</label>");
                                    			out.write("</div>");
                                    			out.write("<div class='col-sm-8'>");
	                                				out.write("<input name=1-"+i+" class='form-control'>");
	                                			out.write("</div>");
                                    		out.write("</div>");
                                    	}
                                    	out.write("<input id='noa-1' value='"+no_of_ans+"' type='hidden'>");
                                    %>
                                    </div>
                              	</div>
                            </div>
                        </div>
                    </div>
            		<%
            			for(int i=2; i<=no_of_qst; i++){
            				out.write("<div class='col-sm-12' id='"+i+"' value='"+i+"' style='display:none'>");
            					out.write("<div class='panel panel-default'>");
            						out.write("<div class='panel-heading'>");
            							out.write("<strong>Question No. "+i+"</strong>");
            						out.write("</div>");
            						out.write("<div class='panel-body'>");
            							out.write("<div class='form-group'>");
            								out.write("<label>Question :</label>");
            								out.write("<textarea class='form-control' rows='3' id='Question"+i+"' name='"+i+"'></textarea><br><br>");
            								out.write("<div class='container' id='cont-"+i+"'>");
	            								for(int j=1; j<=5; j++){
	                                        		ans_no = j;
	                                        		if(j>no_of_ans){out.write("<div class='row' id='"+i+"-"+j+"' style='display:none;'>");}
	                                        		else{out.write("<div class='row' id='"+i+"-"+j+"'>");}
	                                        			out.write("<div class='col-sm-2'>");
	                                        				out.write("<label style='float:right'>Option "+j+" :</label>");
	                                        			out.write("</div>");
	                                        			out.write("<div class='col-sm-8'>");
	    	                                				out.write("<input name=1-"+j+" class='form-control'>");
	    	                                			out.write("</div>");
	                                        		out.write("</div>");
	                                        	}
	            								out.write("<input id='noa-"+i+"' value='"+no_of_ans+"' type='hidden'>");
            								out.write("</div>");
            							out.write("</div>");
            						out.write("</div>");
            					out.write("</div>");
            				out.write("</div>");
            			}
            		%>
            </div>            
            <br>
            <div class='col-lg-12 col-sm-3' style='float:right;'>
	            <button value="1" id="btn" onclick="nextQst(this.value)" class="btn btn-info" style="float:right; margin-left:2%; background-color:#16a085;" type="button"><i class="fa fa-hand-o-right" aria-hidden="true"></i>&nbsp;Next</button>
	            <% 
			    if(no_of_ans>2){
					out.write("<button value='1' id='deleteBtn' class='btn btn-danger' style='float:right; margin-left:2%;' onclick='deleteOpt(this.value)' type='button'><strong>- Delete last option</strong></button>");
				}
				if(no_of_ans<5){
					out.write("<button value='1' id='addBtn' class='btn btn-primary' style='float:right; margin-left:2%;' onclick='addOpt(this.value)' type='button'><strong>+ Add another option</strong></button>");
				}
			    %>
			    <button value="1" id="b-btn" onclick="prevQst(this.value)" class="btn btn-info" style="float:right; background-color:#16a085;" disabled type="button"><i class="fa fa-hand-o-left" aria-hidden="true"></i>&nbsp;Back</button>
	            <br><br><br><br><br>
            </div><br>
            
            <div id="alert" class="alert alert-success" style="display:none;">
            	<center>
            	<h4>You have set all the questions. Are you want to save it ?</h4>
            	<button class="btn btn-success" type="submit">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-warning" type='button' onclick="viewAgain()">Check it again</button>
            	</center>
            </div>
    	</div>
	
		</form>
	</div>
	
</body>

</html>