package com.servlet;


import java.io.IOException;

import com.DB.DBConnect;
import com.dao.UserDAO;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/user_login")
public class UserLoginServlet extends HttpServlet
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
			User u=new User();	
			
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
				
				UserDAO dao=new UserDAO(DBConnect.getConn());
				
				//getting the user 
				User user=dao.user_login(em, ps);
				
				
				//checking is user is registered
				if(user !=null)
				{
					session.setAttribute("userobj", user);
					
					user.setRole("user");
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
