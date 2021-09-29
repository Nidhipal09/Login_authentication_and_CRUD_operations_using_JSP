package com.usermanagement.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.usermanagement.bean.User;


public class UserDao {

public static Connection getConnection(){
	Connection con=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/usermanagement","root","");
	}catch(Exception e){System.out.println(e);}
	return con;
}


public static int save(User u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into user(name, gender, course, duration) values(?,?,?,?)");
		ps.setString(1,u.getName());
		ps.setString(2,u.getGender());
		ps.setString(3,u.getCourse());
		ps.setInt(4,u.getDuration());
	
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println(e);}
	return status;
}
public static int update(User u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update user set name=?,gender=?,course=?,duration=? where id=?");
		
		ps.setString(1,u.getName());
		ps.setString(2,u.getGender());
		ps.setString(3,u.getCourse());
		ps.setInt(4,u.getDuration());
        ps.setInt(5,u.getId());
		status=ps.executeUpdate();
		
		
	}catch(Exception e){System.out.println(e);}
	return status;
}
public static int delete(User u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("delete from user where id=?");
		ps.setInt(1,u.getId());
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println(e);}

	return status;
}
public static List<User> getAllRecords(){
	List<User> list=new ArrayList<User>();
	
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from user");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			User u=new User();
			u.setId(rs.getInt("id"));
			u.setName(rs.getString("name"));
			u.setGender(rs.getString("gender"));
			u.setCourse(rs.getString("course"));
			u.setDuration(rs.getInt("duration"));
			
			list.add(u);
		}
	}catch(Exception e){System.out.println(e);}
	return list;
}
public static User getRecordById(int id){
	User u=null;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from user where id=?");
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			u=new User();
			u.setId(rs.getInt("id"));
			u.setName(rs.getString("name"));
			u.setGender(rs.getString("gender"));
			u.setCourse(rs.getString("course"));
			u.setDuration(rs.getInt("duration"));
		}
	}catch(Exception e){System.out.println(e);}
	return u;
}
}
