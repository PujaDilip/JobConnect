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

@WebServlet("/update_user_profile")
public class UpdateUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String fname = req.getParameter("fname");
			String email = req.getParameter("email");
			String pwd = req.getParameter("password");
			String phno = req.getParameter("phno");
			String skill = req.getParameter("skill");
			String experience = req.getParameter("experience");
			
			UserDAO dao = new UserDAO(DBConnect.getConn());

			User u = new User();

			u.setId(id);
			u.setFname(fname);
			u.setEmail(email);
			u.setPassword(pwd);
			u.setPhno(phno);
			u.setSkill(skill);
			u.setExperience(experience);
			

			boolean f = dao.updateUser(u);

			HttpSession session = req.getSession();
			if (f == true) {
				session.setAttribute("succMsg", "Profile update succesfully. ");
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
