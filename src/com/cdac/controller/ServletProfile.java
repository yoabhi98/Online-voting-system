package com.cdac.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.cdac.model.PartiesBean;
import com.cdac.model.RegistrationBean;

/**
 * Servlet implementation class ServletProfile
 */
public class ServletProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletProfile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String pname = request.getParameter("vote");
		HttpSession session = request.getSession(false);
		String Aadhar = (String) session.getAttribute("Aadhar");
		long adr = Long.parseLong(Aadhar);
		System.out.println(adr + " is long aadhar");
		try {
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory sf = cfg.buildSessionFactory();
			Session s = sf.openSession();
			Transaction t = s.beginTransaction();

			RegistrationBean rb4 = new RegistrationBean();
			Query query4 = s.createQuery("from RegistrationBean where Aadhar=:Aadhar and Status=:Status");
			query4.setParameter("Aadhar", adr);
			query4.setParameter("Status", "Unvoted");
			List result = query4.list();
			if (!result.isEmpty()) {
				Query query0 = s.createQuery("Update RegistrationBean r set r.Status=:Status where Aadhar=:Aadhar");
				query0.setParameter("Status", "voted");
				query0.setParameter("Aadhar", adr);
				int i = query0.executeUpdate();
				if (i > 0) {
					t.commit();
				}
				Transaction t1 = s.beginTransaction();
				PartiesBean pb1 = new PartiesBean();
				Query query1 = s.createQuery("From PartiesBean where PartyName=:pname");
				query1.setParameter("pname", pname);
				List list = query1.list();
				for (Iterator iterator = list.iterator(); iterator.hasNext();) {
					PartiesBean pb = (PartiesBean) iterator.next();
				long c = (long) pb.getVotes();
				
				System.out.println(c);
				System.out.println("votes:" + c);
				c++;
				System.out.println("votes:" + c);

				Query query2 = s.createQuery("Update PartiesBean set votes=:votes where PartyName=:pname");
				query2.setParameter("votes", c);
				query2.setParameter("pname", pname);
				int i1 = query2.executeUpdate();
				System.out.println("votes:" + c);
				if (i1 > 0) {
					t1.commit();
				}
			
			else {
				out.print("<script>alert('You have already voted')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
				rd.include(request, response);
			}}}
			}
		 catch (Exception e) {
			e.printStackTrace();
		}
		if (Aadhar.equals("123123123")) {
			out.print("<script>alert('Congrats ! You have successfully voted')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("AdminProfile.jsp");
			rd.include(request, response);
		} else {
			out.print("<script>alert('Congrats ! You have successfully voted')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
			rd.include(request, response);
		}
	}
}
