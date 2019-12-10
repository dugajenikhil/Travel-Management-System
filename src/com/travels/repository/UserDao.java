package com.travels.repository;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.travels.entity.UserBean;
import com.travels.utility.DbConnection;

public class UserDao {

	public static int addUser(UserBean ub) throws ClassNotFoundException, SQLException, IOException {
		Connection conn=DbConnection.connect();
		PreparedStatement ps= conn.prepareStatement("INSERT INTO `user` (`uname`, `uemail`, `password`) VALUES ('"+ub.getUname()+"', '"+ub.getEmail()+"', '"+ub.getPassword()+"')");
		int status=ps.executeUpdate();
		System.out.println(ps);
		return status;
	}

	public static int cancelTicket(int id) throws SQLException, ClassNotFoundException, IOException {
		Connection conn=DbConnection.connect();
		PreparedStatement ps= conn.prepareStatement("delete from ticket where ticketid=?");
		ps.setInt(1, id);
		int status=ps.executeUpdate();
		return status;
	}

}
