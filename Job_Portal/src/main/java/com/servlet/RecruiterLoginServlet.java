package com.servlet;


import java.io.IOException;

import com.DB.DBConnect;
import com.dao.RecruiterDAO;
import com.dao.UserDAO;
import com.entity.Recruiter;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/recruiter_login")
public class RecruiterLoginServlet extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try 
		{
			
			//getting details from login.jsp
			String em=req.getParameter("email");
			String ps=req.getParameter("password");
			
			//user object
			Recruiter u=new Recruiter();	
			
			//http session creation
			HttpSession session=req.getSession();
			
			//checking if admin
			if("admin@gmail.com".equals(em)&& "admin@121".equals(ps))
			{
				session.setAttribute("userobj",u);
				u.setRole("admin");
				
				resp.sendRedirect("admin.jsp");
			}
			else
			{
				
				RecruiterDAO dao=new RecruiterDAO(DBConnect.getConn());
				
				//getting the user 
				Recruiter r=dao.recuiter_login(em, ps);
				
				
				//checking is user is registered
				if(r !=null)
				{
					session.setAttribute("userobj", r);
					
					r.setRole("Recruiter");
					resp.sendRedirect("home.jsp");
					
					
				}
				
				//if user not registered error msg
				else {
					session.setAttribute("succMsg", "Invalid email and password");
					session.setAttribute("msgStatus", "fail");
					resp.sendRedirect("login.jsp");
				}
					
				
			}
			
			
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
