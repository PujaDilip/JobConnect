package com.dao;
import com.entity.*;
import com.mysql.cj.protocol.Resultset;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.tags.shaded.org.apache.xpath.operations.And;


public class UserDAO {

	
	 private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addUser(User u)
	{
		boolean f=false;
		try {
			
			String sql="insert into user(fname,email,password,phno,skill,experience,role)values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getFname());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getPhno());
			ps.setString(5, u.getSkill());
			ps.setString(6, u.getExperience());
			
			ps.setString(7, "user");
			
			int i=ps.executeUpdate();
			if(i==1)
				f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	
	public User user_login(String em, String psw)
	{
		User u=null;
		try {
			
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				u=new User();
				u.setId(rs.getInt(1));
				u.setFname(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setPhno(rs.getString(5));
				u.setSkill(rs.getString(6));
				u.setExperience(rs.getString(7));
				u.setRole(rs.getString(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return u;
	}
	
	
	public boolean updateUser(User u)
	{
		boolean f=false;
		
		try {
			String sql="update user set fname=?,email=?,password=?,phno=?,skill=?,experience=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, u.getFname());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getPhno());
			ps.setString(5, u.getSkill());
			ps.setString(6, u.getExperience());
			ps.setInt(7, u.getId());
			
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
	public List<User> getAllUser() {
		List<User> list = new ArrayList<User>();
		User u = null;

		try {
			String sql = "select * from user order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				
				
				u.setId(rs.getInt(1));
				u.setFname(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setPhno(rs.getString(5));
				u.setSkill(rs.getString(6));
				u.setExperience(rs.getString(7));
				u.setRole(rs.getString(8));
				

				list.add(u);
				// adding to list

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
