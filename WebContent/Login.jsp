<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="bootstrap.css" />
<link rel="stylesheet" type="text/css" href="bootstrap-grid.css" />
<link rel="stylesheet" type="text/css" href="bootstrap.min.css" />
<title>Insert title here</title>
<style>
.main
{
	background-image: url("voting13.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	height: 100vh;
	width: 100%

}
.main1
{
	color: red;
	position: relative;
	left: 350px;
}
.m
{
	background-color: lightblue;
	padding: 5px;
	position: absolute;
	left: 200px;
	top: 150px;
	border-radius: 10px;
	box-shadow: 5px 5px 15px cyan;
}

</style>
</head>
<body>
 <%
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
%> 
<form action="login" method="post">
		<div class="main">
		<input type="hidden" name="pageName" value="Abhi"/>
		
			<div class="row header">
				<div class="col-sm-10">
					<div class="main1">
						<!-- <img src="voting15.png"> -->
						<h1>ELECTION COMMISSION OF INDIA</h1>
					</div>
				</div> 
				<div class="col-sm-2">
					<!-- <img src="voting12.png" height="200px" width="800px"> -->
					<img src="voting14.jpg" height="200px">
				</div>
			</div>
			<div class="mainBody">
				<div class="row header1">
					<div class="col-sm-5">
						
		

					</div>
					<div class="col-sm-6">
						<div class="m">
							<div class="row header2">
								<div class="col-sm-4">

								</div>
								<div class="col-sm-7">
									<h1>Login</h1>
								</div>
							</div>
							<div class="row header3">
								<div class="col-sm-4">
									Aadhar Number:-
								</div>
								<div class="col-sm-7">
								<input type="hidden" name="pageName" value="Abhi"/>
									<input type="number" name="Aadhar" class="form-control" placeholder="Enter your Aadhar No."/>	
								</div>
							</div><br>
							<div class="row header4">
								<div class="col-sm-4">
									<div>Password:-</div>
								</div>
								<div class="col-sm-7">
									<input type="password" name="Password" class="form-control" placeholder="******"/>	
								</div>
							</div><br>
							<div class="row header5">
								<div class="col-sm-4">
									
								</div>
								<div class="col-sm-3">
									<input type="submit" value="Login" class="btn btn-success"/>	
								</div>
								<div class="col-sm-1">
									<input type="submit" value="Cancel" class="btn btn-danger"/>	
								</div>
							</div>
							<div class="row header6">
								<div class="col-sm-4">
									
								</div>
								<div class="col-sm-2">
									<li><a href="Registration1.html" style="color: blue">Register</a></li>	
								</div>
								<div class="col-sm-2">
									<li><a href="Nomination.jsp" style="color: blue"
										>Nomination</a></li>	
								</div>
							</div>
							<div class="row header7">
								<div class="col-sm-4">
									
								</div>
								<div class="col-sm-5">
								
								</div>
								<div class="col-sm-2">
									
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-1">
					</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>