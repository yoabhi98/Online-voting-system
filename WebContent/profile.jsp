<%@ page language="java"
	import="java.util.List,org.hibernate.Query,org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction,org.hibernate.cfg.Configuration,com.cdac.model.NominationBean,java.util.Iterator"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="bootstrap.css" />
<link rel="stylesheet" type="text/css" href="bootstrap-grid.css" />
<link rel="stylesheet" type="text/css" href="bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
\
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.head1 {
	background-color: lightblue;
}

.head2 {
	color: red;
}

.head11 {
	position: relative;
	left: 100px;
	top: 130px;
}

.head12 {
	position: relative;
	left: 145px;
}

.m {
	background-color: lightblue;
	padding: 20px;
	position: absolute;
	left: 200px;
	top: 150px;
	border-radius: 10px;
	box-shadow: 5px 5px 15px cyan;
}
</style>
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
	<div class="head">
		<div class="row">
			<div class="col-sm-2">
				<img src="voting15.jpg" height="200px">
			</div>
			<div class="col-sm-8">
				<nav class="navbar navbar-inverse">
				<div class="container-fluid head1">
					<div class="navbar-header head2">
						<h2>ELECTION COMMISSION OF INDIA</h2>
						<br>
					</div>
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">About us</a></li>
						<li><a href="#">Contact us</a></li>
					</ul>
				</div>
				</nav>
			</div>
			<div class="col-sm-2 head11">
				<h4>
					<a href="LogoutServlet">Logout</a><span
						class="glyphicon glyphicon-off"></span>
					</a>
				</h4>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-3 sidenav">
			<div class="btn-group-vertical">
				<div class="well">
					<input class="btn btn-primary"
						onclick="window.location.href='https://en.wikipedia.org/wiki/List_of_political_parties_in_India/'"
						type="button" value="Party">
				</div>
				<div class="well">
					<input class="btn btn-primary"
						onclick="window.location.href='http://eci.nic.in/eci_main1/electoral_law.aspx/'"
						type="button" value="News">
				</div>
				<div class="well">
					<button type="button" onclick="Result.jsp" class="btn btn-primary">Results</button>
				</div>
				
				<div class="well">
					<input class="btn btn-primary"
						onclick="window.location.href='https://en.wikipedia.org/wiki/Chief_Election_Commissioner_of_India/'"
						type="button" value="C.E.C">
				</div>
				<div class="well">
					<input class="btn btn-primary"
						onclick="window.location.href='https://en.wikipedia.org/wiki/Election_Commissioner_of_India'"
						type="button" value="E.C">
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="profile-usermenu">

				<div class="m">
					<div class="row">
						<li class="col-sm-12"><a href="#"> <i
								class="glyphicon glyphicon-user"></i></a>
							<button type="button" class="btn btn-info btn-lg"
								data-toggle="modal" data-target="#myModal">Account
								Settings</button> </a>
							<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Edit</h4>
										</div>
										<div class="modal-body">
											<div class="row">
												<a href="username.jsp" style="color: blue"> Change
													UserName</a>
											</div>

											<div class="row">
												<a href="password.jsp" style="color: blue"> Change
													Password</a>
											</div>
											<div class="row">
												<a href="contact.jsp" style="color: blue"> Change Mobile
													No.</a>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div></li>
					</div><br>
					<div class="row">
						<li class="col-sm-12"><a href="#" target="_blank"> <i
								class="glyphicon glyphicon-ok"></i></a>
							<button type="button" class="btn btn-info btn-lg"
								data-toggle="modal" data-target="#myModal1">Vote</button> </a>
							<div class="modal fade" id="myModal1" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Voting</h4>
										</div>
										<div class="modal-body">
											<%
												try {
													session = request.getSession();
													String Address = (String) session.getAttribute("Address");
													System.out.println(Address);
													Configuration cfg = new Configuration();
													cfg.configure("hibernate.cfg.xml");
													SessionFactory sf = cfg.buildSessionFactory();
													Session s = sf.openSession();
													Transaction t = s.beginTransaction();
													NominationBean nb2 = new NominationBean();
													Query query = s.createQuery("From NominationBean where Address=:Address and Status=:Status");
													query.setParameter("Address", Address);
													query.setParameter("Status","Nominated");
													List result = query.list();

													for (Iterator iterator = result.iterator(); iterator.hasNext();) {
														NominationBean nb3 = (NominationBean) iterator.next();
											%>
											<form action="boy" method="post">
												<div class="row">
													<div class="col-sm-4">
														<%=nb3.getPartyName()%>
													</div>
													<div class="col-sm-2">
														<input type="radio" name="vote"
															value="<%=nb3.getPartyName()%>" />
													</div>
												</div>
												</form-action>
												<br>
												<%
													}
													} catch (Exception e) {
														e.printStackTrace();
													}
												%>
											
										</div>
										<div class="modal-footer">
											<input type="submit" class="btn btn-success" value="vote">
										</div>
									</div>
								</div>
							</div></li>
					</div><br>
					<div class="row">
						<li class="col-sm-12"><a href="#"> <i
								class="glyphicon glyphicon-flag"></i></a>
							<button type="button" class="btn btn-info btn-lg"
								data-toggle="modal" data-target="#myModal2">Help</button> </a>
							<div class="modal fade" id="myModal2" role="dialog">
								<div class="modal-dialog">
									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Helps</h4>
										</div>
										<div class="modal-body">
											<span style="color: blue"><h3>Helpline Number</h3></span>
											<div class="row">
												<h5>Dhananjay Radhanpura(Admin)-9784371357</h5>

											</div>
											<div class="row">
												<h5>Mahima Varshney-9193365983</h5>

											</div>
											<div class="row">
												<h5>Abhishek Mishra-7060628343</h5>
												<p></p>
											</div>
											<div class="row">
												<h5>Aryan Srivastava-9005882519</h5>

											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div></li>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3 sidenav">
			<div class="btn-group-vertical head12">
				<div class="well">
					<input class="btn btn-primary"
						onclick="window.location.href='https://www.mapsofindia.com/assemblypolls/'"
						type="button" value="Election Schedule">
				</div>
				<div class="well">
					<input class="btn btn-primary"
						onclick="window.location.href='https://en.wikipedia.org/wiki/President_of_India'"
						type="button" value="Powers of President">
				</div>
				<div class="well">
					<input class="btn btn-primary"
						onclick="window.location.href='https://en.wikipedia.org/wiki/Election_law'"
						type="button" value="Election Laws">
				</div>
				<div class="well">
					<input class="btn btn-primary"
						onclick="window.location.href='http://eci.nic.in/eci_main1/index.aspx'"
						type="button" value="Current Issues">
				</div>
				<div class="well">
					<input class="btn btn-primary"
						onclick="window.location.href='http://eci.nic.in/eci_main1/eci-publication.aspx'"
						type="button" value="Publication">
				</div>
				<div class="well">
					<input class="btn btn-primary"
						onclick="window.location.href='http://www.socialfish.org/2012/08/online-voting-advantages-and-challenges-for-associations/'"
						type="button" value="Advantages & Challanges">
				</div>
			</div>
		</div>
</body>
</html>