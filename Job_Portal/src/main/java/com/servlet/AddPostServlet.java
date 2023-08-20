package com.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.JobDAO;
import com.entity.Jobs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add_job")
public class AddPostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try
		{
			String title=req.getParameter("title");
			String desc=req.getParameter("desc");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			String location=req.getParameter("location");
			
			String company=req.getParameter("company");
			String pkg=req.getParameter("package");
			String experience=req.getParameter("experience");
			
			
			int recruiter_id= Integer.parseInt(req.getParameter("recruiter_id"));
			
			Jobs j=new Jobs();
			j.setTitle(title);
			j.setDescription(desc);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setCompany(company);
			j.setPkg(pkg);
			j.setExperience(experience);
			j.setRecruiter_id(recruiter_id);
			
			HttpSession session=req.getSession();
			
			
			
			
			
			
			
			
			JobDAO dao=new JobDAO(DBConnect.getConn());
			boolean f=dao.addJobs(j);
			
			
			if(f==true)
			{
				session.setAttribute("succMsg", "Job posted succesfully");
				session.setAttribute("msgStatus", "success");
				resp.sendRedirect("add_job.jsp");
			}
			else
			{
				session.setAttribute("succMsg", "Something went wrong");
				session.setAttribute("msgStatus", "fail");
				resp.sendRedirect("add_job.jsp");
			}


		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

}
