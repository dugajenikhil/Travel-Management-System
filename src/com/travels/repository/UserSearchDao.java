package com.travels.repository;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.travels.entity.UserSearchBean;
import com.travels.utility.DbConnection;

public class UserSearchDao {

	public static ResultSet getAllDetails(UserSearchBean usb) throws ClassNotFoundException, SQLException, IOException {
		Connection conn=DbConnection.connect();
		String sql="select t.travels, b.bustype, r.departure, r.arrival, r.fare, r.from, r.to, b.busid from route r JOIN bus b ON r.busid=b.busid JOIN travels t ON b.travelid=t.travelsid WHERE r.from='"+usb.getFrom()+"' AND r.to='"+usb.getTo()+"' AND r.date='"+usb.getDate()+"'";
		PreparedStatement ps=conn.prepareStatement(sql);
		System.out.println(ps);
		ResultSet result=ps.executeQuery();
		return result;
	}
	
	public static ResultSet getSeatsDetails(int bus_id) throws ClassNotFoundException, SQLException, IOException {
		Connection conn=DbConnection.connect();
		String sql="select * from seats WHERE bus_id="+bus_id;
		PreparedStatement ps=conn.prepareStatement(sql);
		ResultSet result=ps.executeQuery();
		return result;
	}
}
