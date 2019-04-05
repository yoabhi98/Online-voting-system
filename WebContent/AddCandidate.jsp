<%@ page language="java"
	import="java.util.List,org.hibernate.Query,org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction,org.hibernate.cfg.Configuration,com.cdac.model.NominationBean,java.util.Iterator"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
body, html {
	background-color:cyan;
	
}

.center {
	position: relative;
	top: 600px;
}

.Abhi {
	font-size: 19px;
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
}}%>
	<%
		try {
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory sf = cfg.buildSessionFactory();
			Session s = sf.openSession();
			Transaction t = s.beginTransaction();
			NominationBean nb = new NominationBean();
			Query query = s.createQuery("From NominationBean");
			List result = query.list();
			int A = 44;
			for (Iterator iterator = result.iterator(); iterator.hasNext();) {
				NominationBean nb1 = (NominationBean) iterator.next();
	%>
	<form action="Add" method="post">
		<div class="container">
			<div class="row main Abhi">
				<input type="hidden" name="PageName" value="Candidate">
				<div class="col-sm-3">
					<%=nb1.getCandidateName()%>
				</div>
				<div class="col-sm-5 ">
					<%=nb1.getPartyName()%>
				</div>
				<div class="col-sm-3">
					<%=nb1.getAddress()%>
				</div>
				<div class="col-sm-1">

					<input type="checkbox" value="<%=nb1.getCandidateAadhar()%>"
						name="PartyName" />
				</div>
				<br>
				<%
					++A;
						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</div>
		</div>
		<div class="center">
			<div class="col-sm-5"></div>
			<div class="col-sm-2">
				<input type="submit"
					class="btn btn-primary btn-lg btn-block login-button" value="ADD">
			</div>
			<div class="col-sm-5"></div>
		</div>

	</form>
</body>
</html>