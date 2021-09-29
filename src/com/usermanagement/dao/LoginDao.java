package com.usermanagement.dao;

import com.usermanagement.bean.LoginBean;
import com.usermanagement.bean.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {

	public static boolean validate(LoginBean bean){
		boolean status=false;
		try{
			
			Connection con=UserDao.getConnection();
			
			PreparedStatement ps=con.prepareStatement("select * from login where email=? and password=?");
			
			ps.setString(1,bean.getEmail());
			ps.setString(2,bean.getPassword());
			
			ResultSet rs=ps.executeQuery();
			
			status=rs.next();
			
			
		}catch(Exception e){}
		return status;
	}
	
	public static int insert(LoginBean u){
		int status=0;
		try{
			Connection con=UserDao.getConnection();
			PreparedStatement ps=con.prepareStatement("insert into login(email, password) values(?,?)");
			ps.setString(1,u.getEmail());
			ps.setString(2,u.getPassword());
			
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
	
	public static int update(String npassword, String eemail){
		int status=0;
		try{
			Connection con=UserDao.getConnection();
			
			PreparedStatement ps=con.prepareStatement("update login set email= ?,password=? where id=?");
			
			
			ps.setString(1,eemail);
			ps.setString(2,npassword);
			ps.setInt(3, id);
			
			status=ps.executeUpdate();
			
		}catch(Exception e){System.out.println(e);}
		return status;
	}
	
	static int id ; 
	public static boolean searchEmail(String eemail){  // entered email
		boolean status = false;
		try{
			Connection con=UserDao.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from login");
			ResultSet rs=ps.executeQuery();
			 
			while(rs.next()){
				
				if(rs.getString("email").equals(eemail)){
					id = rs.getInt("id");
					status = true;
					break;
				}
			}
		}catch(Exception e){System.out.println(e);}
		return status;
	}
	
	public static boolean searcExistingEmailForSignUP(String eemail){  // entered email
		boolean status = false;
		try{
			Connection con=UserDao.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from login");
			ResultSet rs=ps.executeQuery();
			 
			while(rs.next()){
				
				if(rs.getString("email").equals(eemail)){
					id = rs.getInt("id");
					status = true;
					break;
				}
			}
		}catch(Exception e){System.out.println(e);}
		return status;
	}
}
