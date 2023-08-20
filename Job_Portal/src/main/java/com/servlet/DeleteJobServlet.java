package com.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.JobDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete_job")
public class DeleteJobServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			int recruiter_id=Integer.parseInt(req.getParameter("recruiter_id"));
			JobDAO dao = new JobDAO(DBConnect.getConn());
			boolean f = dao.deleteJob(id);

			HttpSession session = req.getSession();

			if (f == true) {
				session.setAttribute("succMsg", "Job deleted succesfully");
				session.setAttribute("msgStatus", "success");
				/* resp.sendRedirect("home.jsp"); */
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
