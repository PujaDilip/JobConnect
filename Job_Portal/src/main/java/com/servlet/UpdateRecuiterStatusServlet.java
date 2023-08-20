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

@WebServlet("/set_recruiter_status")
public class UpdateRecuiterStatusServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			String status = req.getParameter("status");
			
			RecruiterDAO dao = new RecruiterDAO(DBConnect.getConn());

			Recruiter r = new Recruiter();

			r.setId(id);
			r.setStatus(status);
			

			boolean f = dao.updateRecruiterStatus(r);

			HttpSession session = req.getSession();
			if (f == true) {
				session.setAttribute("succMsg", "Profile update succesfully. ");
				session.setAttribute("msgStatus", "success");
				resp.sendRedirect("recruiter.jsp");
			} else {
				session.setAttribute("succMsg", "Something went wrong");
				session.setAttribute("msgStatus", "fail");
				resp.sendRedirect("recruiter.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
