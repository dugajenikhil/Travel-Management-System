package com.travels.repository;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.travels.entity.LoginBean;
import com.travels.utility.DbConnection;

public class LoginDao {
	public static ResultSet login(LoginBean lb) throws ClassNotFoundException, SQLException, IOException {
		Connection conn=DbConnection.connect();
		PreparedStatement ps= conn.prepareStatement("select password from admin where email='"+lb.getEmail()+"'");
		System.out.println(ps);
		ResultSet result=ps.executeQuery();
		return result;
	}

	public static String getPassword(String email) throws ClassNotFoundException, SQLException, IOException {
		Connection conn=DbConnection.connect();
		PreparedStatement ps= conn.prepareStatement("select password from user where uemail='"+email+"'");
		System.out.println(ps);
		ResultSet result=ps.executeQuery();
		String originalPassword="";
		while(result.next()) {
			originalPassword = result.getString(1);
		}
		return originalPassword;
	}
}
