package com.servlet;
import com.dao.*;
import jakarta.servlet.http.Cookie;
import java.io.IOException;

import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.DB.*;

@WebServlet("/logout")
public class LogoutServlet  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		  HttpSession session=req.getSession();
		  
		  session.removeAttribute("userobj");
		 
		  
		  session.setAttribute("succMsg", "Logged out succesfully");
		  session.setAttribute("msgStatus", "success");
		 resp.sendRedirect("login.jsp");
		 
		
		Cookie cookies[] = req.getCookies();
		
		
		
		
        resp.addCookie(cookies[0]);
		
	}

}
