<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
html,body{
background-color:yellow;

}
container.h3{
color:red;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Election News</title>
</head>
<body>
<%
session=request.getSession(false);
if(session.getAttribute("Aadhar")==null)
{
	out.print("<script>alert('Please login first')</script>");
	RequestDispatcher rd=request.getRequestDispatcher("Login.html");
	rd.include(request,response);
	
}
%>
<div class="container">
<h3>Which people are entitled to vote in an election (e.g. age, residency or literacy requirements, or poll taxes), 
and the procedures by which such persons must register to vote or present identification in order to vote</h3>
<h3>Which people are entitled to hold office (for example, age, residency, birth or citizenship requirements), 
and the procedures candidates must follow to appear on the ballot (such as the formatting and filing of nominating petitions) and
 rules governing write-in candidates</h3>
 <h3>The rules about what subjects may be submitted to a direct popular vote through a referendum or plebiscite, 
 and the rules that governmental agencies or citizen groups must follow to place questions on the ballot for public consideration</h3>
 <h3>How votes are counted at an election, recounts, and election challenges</h3>
 <h3>Definition of electoral fraud and other crimes against the electoral system</h3>
 <a href="welcome.jsp">Home</a>
 </div>
</body>
</html>