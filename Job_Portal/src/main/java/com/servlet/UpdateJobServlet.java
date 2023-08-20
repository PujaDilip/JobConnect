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

@WebServlet("/update_job")
public class UpdateJobServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(req.getParameter("id"));
			
			String title = req.getParameter("title");
			String desc = req.getParameter("desc");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String location = req.getParameter("location");
			String pkg = req.getParameter("package");
			String company = req.getParameter("company");
			String experience = req.getParameter("experience");
			String recruiter_id = req.getParameter("recruiter_id");
			
			JobDAO dao = new JobDAO(DBConnect.getConn());

			Jobs j = new Jobs();

			j.setId(id);
			j.setTitle(title);;
			j.setDescription(desc);;
			j.setCategory(category);
			j.setStatus(status);
			j.setLocation(location);
			j.setPkg(pkg);
			j.setCompany(company);
			j.setExperience(experience);

			boolean f = dao.updateJob(j);
			HttpSession session = req.getSession();

			if (f == true) {
				
				session.setAttribute("succMsg", "Job update succesfully.");
				session.setAttribute("msgStatus", "success");
				resp.sendRedirect("view_jobs.jsp?id="+recruiter_id);
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
