package com.servlet;

import java.io.IOException;

import com.DB.DBConnect;

import com.dao.*;
import com.entity.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update_recruiter_profile")
public class UpdateRecruiterProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String company_name = req.getParameter("company_name");
			String recruiter_name = req.getParameter("recruiter_name");
			String location= req.getParameter("location");
			String phno = req.getParameter("phno");
			String email = req.getParameter("email");
			String status = req.getParameter("status");
			String password=req.getParameter("password");
			
			RecruiterDAO dao = new RecruiterDAO(DBConnect.getConn());

			Recruiter r = new Recruiter();

			r.setId(id);
			r.setCompany_name(company_name);
			r.setRecruiter_name(recruiter_name);
			r.setLocation(location);
			r.setPhno(phno);
			r.setEmail(email);
			r.setPassword(password);
			

			boolean f = dao.updateRecruiterProfile(r);

			HttpSession session = req.getSession();
			if (f == true) {
				session.setAttribute("succMsg", "Profile update succesfully. Please login again");
				session.setAttribute("msgStatus", "success");
				resp.sendRedirect("login.jsp");
			} else {
				session.setAttribute("succMsg", "Something went wrong");
				session.setAttribute("msgStatus", "fail");
				resp.sendRedirect("home.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
