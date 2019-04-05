package com.cdac.login;

import com.cdac.mail.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.cdac.model.RegistrationBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Email = null;String Address="";
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		if (request.getParameter("pageName").equals("Abhi")) {
			String Aadhar = request.getParameter("Aadhar");
			String Password = request.getParameter("Password");
			long adr = Long.parseLong(Aadhar);
			try {
				Configuration cfg = new Configuration();
				cfg.configure("hibernate.cfg.xml");
				SessionFactory sf = cfg.buildSessionFactory();
				Session s = sf.openSession();
				Transaction t = s.beginTransaction();
				RegistrationBean rb = new RegistrationBean();
				System.out.println(Aadhar + "::" + Password);
				Query query = s.createQuery("From RegistrationBean where Aadhar=:Aadhar and Password=:Password");
				query.setParameter("Aadhar", adr);
				query.setParameter("Password", Password);
				List result = query.list();
				if (!result.isEmpty()) {
					for (Iterator iterator = result.iterator(); iterator.hasNext();) {
						RegistrationBean rb1 = (RegistrationBean) iterator.next();
						Email = rb1.getUemail();
						Address=rb1.getAddress();
					}
					System.out.println("result:" + Email);
					HttpSession session = request.getSession(true);
					session.setAttribute("Email", Email);
					session.setAttribute("Aadhar", Aadhar);
	            	session.setAttribute("Address",Address);
					SendMail sm = new SendMail();
					SendMail.send(Email);
					out.print("Enter Your One Time Authentication here");
					RequestDispatcher rd = request.getRequestDispatcher("OTP.jsp");
					rd.forward(request, response);
				} else {
					out.print("You have Entered Wrong Aadhar card and Password");
					RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
					rd.include(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (request.getParameter("pageName").equals("OTPcheck")) {
			SendMail sm = new SendMail();
			String OTP = SendMail.getOTP();
			String OTP2 = request.getParameter("otp");
			System.out.println(OTP);
			if (OTP2.equals(OTP)) {
				HttpSession session = request.getSession(false);
				String Aadhar=(String) session.getAttribute("Aadhar");
				if(Aadhar.equals("123123123123"))
				{
				out.print("<script>alert('You have successfully loged in')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("AdminProfile.jsp");
				rd.include(request, response);
			}
				else {
					out.print("<script>alert('You have successfully loged in')</script>");
					RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
					rd.include(request, response);
				
				}
				}
				
				else {
				HttpSession session = request.getSession();
				session.invalidate();
				RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
				rd.include(request, response);

			}
		}

	}
}
