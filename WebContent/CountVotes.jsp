
    <%@ page language="java"
	import="java.util.List,org.hibernate.Query,org.hibernate.Session,org.hibernate.SessionFactory,org.hibernate.Transaction,org.hibernate.cfg.Configuration,com.cdac.model.PartiesBean,java.util.Iterator"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		try {
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory sf = cfg.buildSessionFactory();
			Session s = sf.openSession();
			Transaction t = s.beginTransaction();
			PartiesBean nb = new PartiesBean();
			Query query = s.createQuery("From PartiesBean");
			List result = query.list();
			int A = 44;
			for (Iterator iterator = result.iterator(); iterator.hasNext();) {
				PartiesBean pb1 = (PartiesBean) iterator.next();
	%><form action="Add" method="post">
	<div class="container">
	
		<div class="row main Abhi">
		<input type="hidden" name="PageName" value="Candidate">
		<div class="row">
			<div class="col-sm-8 ">
				<h3><%=pb1.getPartyName()%></h3>
			</div>
			<div class="col-sm-4">
			<h3><%=pb1.getVotes()%></h3>
			</div>
			</div>
			<%
				
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</div>
		</div>
		
	</form>
</body>
</html>