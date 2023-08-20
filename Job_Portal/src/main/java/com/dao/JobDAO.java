package com.dao;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.catalina.valves.rewrite.InternalRewriteMap.Escape;

import com.entity.Jobs;
import com.mysql.cj.PreparedQuery;
import com.mysql.cj.protocol.Resultset;

public class JobDAO {

	// creating a connection object
	private Connection conn;

	// constructor
	public JobDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	// function to add jobs to database
	public boolean addJobs(Jobs j) {
		boolean f = false;
		try {
			String sql = "insert into jobs(title,description,category,status,location,recruiter_id,pkg,company,experience) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			ps.setInt(6, j.getRecruiter_id());
			ps.setString(7, j.getPkg());
			ps.setString(8, j.getCompany());
			ps.setString(9, j.getExperience());

			// if success executeUpdate return else garbage value
			int i = ps.executeUpdate();

			// checking i value
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Jobs> getAllJobs() {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;

		try {
			String sql = "select * from jobs order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");// converting to string

				j.setPkg(rs.getString(9));
				j.setCompany(rs.getString(10));
				j.setExperience(rs.getString(11));
				list.add(j);
				// adding to list

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Jobs> getAllJobsForUser() {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;

		try {
			String sql = "select * from jobs where status=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String strDate= formatter.format(rs.getTimestamp(7));
				
				j.setPdate(strDate);// converting to string
				j.setCompany(rs.getString(10));
				j.setPkg(rs.getString(9));
				j.setExperience(rs.getString(11));
				// adding to list
				list.add(j);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Jobs getJobById(int id) {

		Jobs j = null;

		try {
			String sql = "select * from jobs where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getNString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String strDate= formatter.format(rs.getTimestamp(7));
				j.setPdate(strDate);// converting to string
				j.setCompany(rs.getString(10));
				j.setPkg((rs.getString(9)));
				j.setExperience(rs.getString(11));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return j;
	}

	public List<Jobs> getJobByRecruiterId(int id) {

		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;

		try {
			String sql = "select * from jobs where recruiter_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");// converting to string
				j.setCompany(rs.getString(10));
				j.setPkg((rs.getString(9)));
				j.setExperience(rs.getString(11));
				list.add(j);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean updateJob(Jobs j) {
		boolean f = false;
		try {
			String sql = "update jobs set title=?,description=?,category=?,status=?,location=?,pkg=?,company=?,experience=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			ps.setString(6, j.getPkg());
			ps.setString(7, j.getCompany());
			ps.setString(8, j.getExperience());
			ps.setInt(9, j.getId());

			// if success executeUpdate return else garbage value
			int i = ps.executeUpdate();

			// checking i value
			if (i == 1) 
				f = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteJob(int id) {
		boolean f = false;

		try {
			
			String sql1="delete from applied_jobs where job_id=?";
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			ps1.setInt(1, id);
			
			String sql2 = "delete from jobs where id=?";
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps2.setInt(1, id);

			int i = ps1.executeUpdate();
			int j = ps2.executeUpdate();

			if ((i == 1)&&(j==1)) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Jobs> getJobORLocAndCat(String loc, String cat) {
		List<Jobs> list = new ArrayList<Jobs>();

		Jobs j = null;
		try {

			String sql = "select * from jobs where category=? or location=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, loc);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String strDate= formatter.format(rs.getTimestamp(7));
				j.setPdate(strDate);
				j.setCompany(rs.getString(10));
				j.setPkg(rs.getString(9));
				j.setExperience(rs.getString(11));
				list.add(j);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Jobs> getJobAndLocAndCat(String loc, String cat) {
		List<Jobs> list = new ArrayList<Jobs>();

		Jobs j = null;
		try {

			String sql = "select * from jobs where category=? and location=? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, loc);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				String strDate= formatter.format(rs.getTimestamp(7));
				j.setPdate(strDate);
				j.setCompany(rs.getString(10));
				j.setPkg(rs.getString(9));
				j.setExperience(rs.getString(11));
				list.add(j);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
