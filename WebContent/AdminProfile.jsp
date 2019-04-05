<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.collapse {
	margin-bottom: 0;
	border-radius: 0;
	background-color: #B0E0E6;
}

.row.content {
	height: 600px;
	background-image: url("p.jpg");
	background-repeat: no-repeat;
	background-size: contain;
	background-position: center;
	opacity: 0.9;
}

.sidenav {
	padding-top: 20px;
	background-color: #FFF8DC;
	height: 100%;
}

.main {
	height: 600px;
}

footer {
	background-color: #2F4F4F;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>
<%-- 	<%
session=request.getSession(false);
if(session.getAttribute("Aadhar")==null)
{
	out.print("<script>alert('Please login first')</script>");
	RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
	rd.include(request,response);
	
}
else 
{
	if(session.getAttribute("Aadhar")=="123123123123")
	{
		RequestDispatcher rd=request.getRequestDispatcher("AdminProfile.jsp");
		rd.include(request,response);
	}
	else{
	RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
	rd.include(request,response);
}}
%> --%>
	<div class="collapse navbar-collapse" id="myNavbar">
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Parties</a></li>
			<li><a href="#">Contact</a></li>
			<li><h4 style="position: relative; left: 300px; color: red;">ADMIN:
					DHANANJAY RADHANPURA</h4></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="LogoutServlet"><span class="glyphicon glyphicon-log-out"></span>
					Logout</a></li>
		</ul>
	</div>
	</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<h3>
					<a href="window.location.href='http://eci.nic.in/eci_main1/electoral_law.aspx/'">News</a>
				</h3>
				<h3>
					<a href="ElectionLaws.jsp">Election Laws</a>
				</h3>
				<h3>
					<a href="#">Nominations</a>
				</h3>
			</div>
			<div class="col-sm-8 main">
				<h3 style="color: #808000;">Honor is not the exclusive property
					of any political party</h3>

				<h3 style="color: #808000;">If the deaf are to hear the sound
					has to be very good.: BHAGAT SINNGH</h3>


			</div>
			<div class="col-sm-2 sidenav">
				<div class="well">
			

					<h3>
						<a href="AddCandidate.jsp">ADD Candidates</a>
					</h3>
				</div>
				<div class="well">
					<h3>
						<a href="CountVotes.jsp">Count Votes</a>
					</h3>
				</div>
				<div class="well">
					<h3>
						<a href="Result.jsp">Show Result</a>
					</h3>
				</div>
				<div class="well">
					<h3>
						<a href="AddParty.jsp">Add Party</a>
					</h3>
				</div>
				<div class="well">
					<h3>
						<a href="ServletProfile">Vote</a>
					</h3>
				</div>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
	<!-- <li><a href="#"><span class="glyphicon glyphicon-wrench"></span>
			Setting</a></li> -->
	</footer>
</body>
</html>