<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body
{
background-color: pink;
}
.main {
	background-color: lightblue;
	padding: 5px;
	position: absolute;
	left: 550px;
	top: 300px;
	box-shadow: 5px 5px 15px cyan;
}
</style>


<body>
	<form action="Add" method="post">
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
		
			<div class="container main">
			<input type="hidden" name="PageName" value="Party">
				<div class="row">
					Party Name:      <input type="text" name="pname" class="form-control"
						placeholder="Enter party name" />
				</div>
				<br><br>
				<div class="row">
					Leader Name:<input type="text" name="lname" class="form-control"
						placeholder="Enter Leader name" />
				</div>
				<div class="row">
					<input type="submit" class="btn btn-primary btn-lg btn-block login-button" value="ADD">
				</div>
			</div>
		
	</form>
</body>
</html>