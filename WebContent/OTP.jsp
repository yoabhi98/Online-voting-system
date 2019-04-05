<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet" type="text/css" href="bootstrap-grid.css">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<title>OVS</title>
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
	left: 400px;
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
	
		RequestDispatcher rd=request.getRequestDispatcher("OTP.jsp");
		rd.include(request,response);
	
}
%> 
<form action="login" method="post">
<div class="main">
			<input type="hidden" name="pageName" value="OTPcheck" />

			<div class="row header">
				<div class="col-sm-10">
					<div class="main1">
						<h1>ELECTION COMMISSION OF INDIA</h1>
					</div>
				</div>
				<div class="col-sm-2">
					<img src="voting14.jpg" height="200px">
				</div>
			</div>
			<div class="mainBody">
				<div class="row header1">
					<div class="col-sm-5"></div>
					<div class="col-sm-6">
						<div class="m">
							<div class="row header2">
								<h1>Enter OTP</h1>
							</div>
							<div class="row header3">
								<h4>Check your email for the OTP</h4>
							</div>
							<div class="row header4">
								<input type="number" name="otp" class="form-control"
									placeholder="One Time Password" />
							</div>
							<div class="row header5">
								<div class="col-sm-2"></div>
								<div class="col-sm-4">
									<input type="submit" value="Login" class="btn btn-success" />
								</div>
							</div>
	</form>
				
</body>
</html>