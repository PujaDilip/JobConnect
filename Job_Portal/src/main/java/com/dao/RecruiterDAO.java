 package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.*;

public class RecruiterDAO {

	private Connection conn;

	public RecruiterDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addRecruiter(Recruiter r) {
		boolean f = false;
		try {

			String sql = "insert into recruiter(company_name,recruiter_name,location,phno,email,password,status,role)values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, r.getCompany_name());
			ps.setString(2, r.getRecruiter_name());
			ps.setString(3, r.getLocation());
			ps.setString(4, r.getPhno());
			ps.setString(5, r.getEmail());
			ps.setString(6, r.getPassword());
			ps.setString(7, "INACTIVE");
			ps.setString(8, "Recruiter");

			int i = ps.executeUpdate();
			if (i == 1)
				f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Recruiter> getAllRecruiter() {
		List<Recruiter> list = new ArrayList<Recruiter>();
		Recruiter r = null;

		try {
			String sql = "select * from recruiter order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				r = new Recruiter();

				r.setId(rs.getInt(1));
				r.setCompany_name(rs.getString(2));
				r.setRecruiter_name(rs.getString(3));
				r.setLocation(rs.getString(4));
				r.setPhno(rs.getString(5));
				r.setEmail(rs.getString(6));
				r.setPassword(rs.getString(7));
				r.setStatus(rs.getString(8));
				r.setRole(rs.getString(9));

				list.add(r);
				// adding to list

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Recruiter getRecruiterById(int id) {

		Recruiter r = null;

		try {
			String sql = "select * from recruiter where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				r = new Recruiter();
				r.setId(rs.getInt(1));
				r.setCompany_name(rs.getString(2));
				r.setRecruiter_name(rs.getString(3));
				r.setLocation(rs.getString(4));
				r.setPhno(rs.getString(5));
				r.setEmail(rs.getString(6));
				r.setPassword(rs.getString(7));
				r.setStatus(rs.getString(8));
				r.setRole(rs.getString(9));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return r;
	}

	public boolean updateRecruiterStatus(Recruiter r) {
		boolean f = false;
		try {
			String sql = "update recruiter set status=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, r.getStatus());
			ps.setInt(2, r.getId());

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

	public Recruiter recuiter_login(String em, String psw) {
		Recruiter r = null;
		try {

			String sql = "select * from recruiter where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				r = new Recruiter();
				r.setId(rs.getInt(1));
				r.setCompany_name(rs.getString(2));
				r.setRecruiter_name(rs.getString(3));
				r.setLocation(rs.getString(4));
				r.setPhno(rs.getString(5));
				r.setEmail(rs.getString(6));
				r.setPassword(rs.getString(7));
				r.setStatus(rs.getString(8));
				r.setRole(rs.getString(9));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return r;
	}
	public boolean updateRecruiterProfile(Recruiter r)
	{
		boolean f=false;
		
		try {
			String sql="update recruiter set company_name=?,recruiter_name=?,location=?,phno=?,email=?,password=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, r.getCompany_name());
			ps.setString(2, r.getRecruiter_name());
			ps.setString(3, r.getLocation());
			ps.setString(4, r.getPhno());
			ps.setString(5, r.getEmail());
			ps.setString(6, r.getPassword());
			ps.setInt(7, r.getId());
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
				
			
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	

}
