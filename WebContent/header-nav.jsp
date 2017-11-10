<%
	    String user_name = "";
		HttpSession session1 = request.getSession(false);
		if (session == null) {
			response.sendRedirect("index.jsp");
			return;
		} else {
			user_name = (String)session1.getAttribute("name");
			String user_email = (String)session1.getAttribute("email");
			String user_username = (String)session1.getAttribute("username");
			//String active_page = request.getParameter("active_page");
		}		
%>
		<nav class="navbar navbar-inverse" style="margin-bottom: 0px; background-color: #34495e">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
		      </button>
		      <a class="navbar-brand" href="userHome.jsp" style="color:white;"><i class="fa fa-spinner fa-spin"></i>&nbsp;&nbsp;Happy-Quiz</a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav navbar-right">
		      	<li <%if(request.getParameter("active_page").equals("home")){out.write("class='active'");} %>>
                	<a href="userHome.jsp">
	     				<i class="fa fa-home fa-fw list-items"></i>
	                	<span class="list-items">Home</span>
                    </a>                            
               	</li>
               	<li <%if(request.getParameter("active_page").equals("quizzes")){out.write("class='active'");} %>>
                	<a href="viewQuizzes.jsp">
	                	<i class="fa fa-question-circle fa-fw list-items" aria-hidden="true" ></i>
	                    <span class="list-items">My Quizzes</span>
                   	</a>
               	</li>
                <li <%if(request.getParameter("active_page").equals("competitions")){out.write("class='active'");} %>>
                	<a href="competitions.jsp">
		            	<i class="fa fa-list-alt fa-fw list-items" aria-hidden="true"></i>
		           		<span class="list-items">Competitions</span>
                    </a>
               	</li>
		        <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <!-- <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a> -->
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
		        <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="text-uppercase">
                        	<i class="fa fa-user fa-fw"></i>
                            <span><strong><%= user_name.split(" ")[0] %></strong></span>&nbsp;
                        </span>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		
		