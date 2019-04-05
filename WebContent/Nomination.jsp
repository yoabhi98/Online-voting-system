<%@ page language="java"
	import="java.util.List,org.hibernate.Query,org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction,org.hibernate.cfg.Configuration,com.cdac.model.PartiesBean,java.util.Iterator"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="Registration1.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="bootstrap.css">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="bootstrap-grid.css">
<title>Admin</title>
</head>
<body>
	<%-- <%
session=request.getSession(false);
if(session.getAttribute("Aadhar")==null)
{
	out.print("<script>alert('Please login first')</script>");
	RequestDispatcher rd=request.getRequestDispatcher("Nomination.jsp");
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
 --%>	<div class="container">

		<div class="row main">

			<div class="main-login main-center">

				<h5>
					<span style="color: red">ELECTION COMMISSION OF INDIA</span>
				</h5>
				<form class="" method="post" action="hello">

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Candidate
							Name</label>
						<div class="cols-sm-10">
							<input type="hidden" name="PageName" value="Nomination" /> <input
								type="text" class="form-control" name="cname"
								required="required" placeholder="Enter your Name" />

						</div>
					</div>
					<div class="form-group">
						<label for="PName" class="cols-sm-2 control-label">Party
							Name</label>

						<div class="cols-sm-10">
							<div class="input-group">
								<%
									try {
										Configuration cfg = new Configuration();
										cfg.configure("hibernate.cfg.xml");
										SessionFactory sf = cfg.buildSessionFactory();
										Session s = sf.openSession();
										Transaction t = s.beginTransaction();
										PartiesBean pb = new PartiesBean();
										Query query = s.createQuery("From PartiesBean");
										List result = query.list();
										for (Iterator iterator = result.iterator(); iterator.hasNext();) {
											PartiesBean nb1 = (PartiesBean) iterator.next();
								%>



<div class="row">
								<input type="radio" name="pname"
									value="<%=nb1.getPartyName()%>" /><%=nb1.getPartyName()%>
</div><br>

								<%
									}
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>

							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">Candidate
							Email</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
									type="email" class="form-control" required="required"
									name="mail" placeholder="uemail@gmail.com" />
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="gender" class="cols-sm-2 control-label">Gender</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
									type="radio" value="M" name="cgender" required="required" />Male
								<input type="radio" value="F" name="cgender" required="required" />Female
							</div>
						</div>


						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Aadhar</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
										type="number" class="form-control" pattern="[0-9]{12}"
										required="required" name="aadhar" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="Mobile" class="cols-sm-2 control-label">Mobile</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
										type="number" class="form-control" pattern="[0-9]{10}"
										required="required" placeholder="enter your contact no."
										name="ccontact" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Address</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <select
										name="Region">
										<option value="Mumbai">Maharashtra</option>
										<option value="Delhi" selected="selected">Delhi</option>
										<option value="Agra">Haryana</option>
										<option value="UP">Uttar Pradesh</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
										type="password" required="required" class="form-control"
										name="password" placeholder="Enter your Password" />
								</div>
							</div>
						</div>
						<div class="form-group ">
							<input type="submit"
								class="btn btn-primary btn-lg btn-block login-button"
								value="Submit">
						</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>