package com.cdac.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.cdac.model.PartiesBean;

/**
 * Servlet implementation class ControlAdmin
 */
public class ControlAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControlAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		if (request.getParameter("PageName").equals("Candidate")) {
			String Values[] = request.getParameterValues("PartyName");
			String Aadhar = "";
			for (String s : Values) {
				Aadhar = s;
				long ss= Long.parseLong(Aadhar);
				Transaction t = null;
				try {
					Configuration cfg = new Configuration();
					cfg.configure("hibernate.cfg.xml");
					SessionFactory sf = cfg.buildSessionFactory();
					Session s1 = sf.openSession();
					t = s1.beginTransaction();
					Query query = s1.createQuery("Update NominationBean n set n.Status=:Status where n.CandidateAadhar=:Aadhar");
					query.setParameter("Status", "Nominated");
					query.setParameter("Aadhar", ss);
					int row = query.executeUpdate();
					if (row > 0) {
						t.commit();
					}
				} catch (Exception e) {
					e.printStackTrace();
					t.rollback();
				}
				System.out.println(Aadhar);
				out.print("<script>alert('Candidate Add Successful')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("AdminProfile.jsp");
			}
		}
		if (request.getParameter("PageName").equals("Party")) {
			String partyName = request.getParameter("pname");
			String leaderName = request.getParameter("lname");
			try {
				Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
				SessionFactory sf = cfg.buildSessionFactory();
				Session s = sf.openSession();
				Transaction t = s.beginTransaction();
				PartiesBean pb = new PartiesBean();
				pb.setLeaderName(leaderName);
				pb.setPartyName(partyName);
				s.persist(pb);
				t.commit();
				s.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			out.print("<script>alert('Party Add Successful')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("AdminProfile.jsp");
		}
	}
}
