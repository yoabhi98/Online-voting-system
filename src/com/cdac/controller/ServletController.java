package com.cdac.controller;
import java.io.IOException; 
import java.io.PrintWriter;
import com.cdac.model.*;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.exception.ConstraintViolationException;

/**
 * Servlet implementation class ServletController
 */
@WebServlet("/ServletController")
public class ServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletController() {
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
		System.out.println(request.getParameter("PageName"));
		if(request.getParameter("PageName").equals("Registers"))
		{
		String Name = request.getParameter("uname");
		String Fname = request.getParameter("fname");
		String Contact = request.getParameter("ucontact");
		String DOB =request.getParameter("udob");
		String aadhar =(request.getParameter("aadhar"));
		String Address = request.getParameter("Region");
		String Email = request.getParameter("mail");
		String Password = request.getParameter("password");
		String gender = request.getParameter("ugender");
		if (Password.length() >= 8 && aadhar.length() == 12) {
			try {
				Configuration cfg =  new Configuration().configure("hibernate.cfg.xml");
				SessionFactory sf = cfg.buildSessionFactory();
				Session s = sf.openSession();
				Transaction t = s.beginTransaction();
				RegistrationBean rb = new RegistrationBean();
				long adr = Long.parseLong(aadhar);

				rb.setAadhar(adr);
				rb.setAddress(Address);
				rb.setFname(Fname);
				rb.setPassword(Password);
				rb.setUcontact(Contact);
				rb.setGender(gender);
				int contactLength = rb.getUcontact().length();
				if(contactLength != 10) {
					throw new IllegalArgumentException("/Length of Contact is not equal to 10");
				}
				rb.setUdob(DOB);
				rb.setUemail(Email);
				rb.setUgender(gender);
				rb.setUname(Name);
				rb.setStatus("Unvoted");
				System.out.println(rb.getUemail());
				s.persist(rb);
				t.commit();
				s.close();
				System.out.println("successfully saved");
				out.print("<script>alert('Your Registration is successfull')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
				rd.include(request, response);
			} 
			catch(ConstraintViolationException e)
			{
				out.print("<script>alert('Duplicate entry "+aadhar+"')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("Register1.jsp");
				rd.include(request, response);
			}
			catch (IllegalArgumentException e) {
				// TODO: handle exception
				out.print("<script>alert('Invalid Contact Number')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("Register1.jsp");
				rd.include(request, response);
			}
			catch (Exception e) {
				e.printStackTrace();
				out.print("<script>alert('Invalid inputs!')</script>");
			}

		} 
		else {
			out.print("<script>alert('You have Entered wrong details')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("Register1.jsp");
			rd.include(request, response);
		}
		}
		if(request.getParameter("PageName").equals("Nomination"))
		{
			String Name = request.getParameter("cname");
			String Pname = request.getParameter("pname");
			String Contact = request.getParameter("ccontact");
		
			String aadhar =(request.getParameter("aadhar"));
			String Address = request.getParameter("Region");
			String Email = request.getParameter("mail");
			String Password = request.getParameter("password");
			String gender = request.getParameter("cgender");
			if (Password.length() >= 8 && aadhar.length() == 12) {
				try {
					long adr = Long.parseLong(aadhar);
					Configuration cfg = new Configuration().configure("hibernate.cfg.xml");
					SessionFactory sf = cfg.buildSessionFactory();
					Session s = sf.openSession();
					Transaction t = s.beginTransaction();
					NominationBean nb=new NominationBean();
					nb.setCandidateAadhar(adr);
					nb.setCandidateEmail(Email);
					nb.setCandidateName(Name);
					nb.setCandidatePass(Password);
					nb.setGender(gender);
					nb.setPartyName(Pname);
					nb.setAddress(Address);
					nb.setStatus("Unnominated");
					nb.setVotes(0);
					nb.setMobile(Contact);
					int contactLength = nb.getMobile().length();
					if(contactLength != 10) {
						throw new IllegalArgumentException("/Length of Contact is not equal to 10");
					}
					s.persist(nb);
					t.commit();
					s.close();
					System.out.println("successfully saved");
					out.print("<script>alert('Your Nomination is successfull')</script>");
					RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
					rd.include(request, response);
				} 
				catch(ConstraintViolationException e)
				{
					out.print("<script>alert('Duplicate entry "+aadhar+"')</script>");
					RequestDispatcher rd = request.getRequestDispatcher("Nomination.jsp");
					rd.include(request, response);
				}
				catch (IllegalArgumentException e) {
					// TODO: handle exception
					out.print("<script>alert('Invalid Contact Number')</script>");
					RequestDispatcher rd = request.getRequestDispatcher("Nomination.jsp");
					rd.include(request, response);
				}
				catch (Exception e) {
					e.printStackTrace();
					out.print("<script>alert('Invalid inputs!')</script>");
				}

			} else {
				out.print("<script>alert('You have Entered wrong details')</script>");
				RequestDispatcher rd = request.getRequestDispatcher("Nomination.jsp");
				rd.include(request, response);
			}
			
			
		}
		}
}
