package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;
import com.entity.Applied_jobs;

public class AppliedJobsDAO {

	private Connection conn;

	public AppliedJobsDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addAppliedJobs(Applied_jobs a) {
		boolean f = false;
		try {
			String sql = "insert into applied_jobs(job_id,user_id) values(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, a.getJob_id());
			ps.setInt(2, a.getUser_id());

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

	public List<Integer> getAppliedJobs(int user_id) {

		List<Integer> list = new ArrayList<Integer>();
		
		Applied_jobs a = null;

		try {
			String sql = "select * from applied_jobs where user_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				a = new Applied_jobs();
				a.setJob_id(rs.getInt(1 ));
				/*
				 * a.setTitle(rs.getNString(2)); j.setDescription(rs.getString(3));
				 * j.setCategory(rs.getString(4)); j.setStatus(rs.getString(5));
				 * j.setLocation(rs.getString(6)); j.setPdate(rs.getTimestamp(7) + "");//
				 * converting to string j.setCompany(rs.getString(10));
				 * j.setPkg((rs.getString(9))); j.setExperience(rs.getString(11));
				 */
				
				list.add(a.getJob_id());
				

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
