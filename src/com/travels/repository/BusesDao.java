package com.travels.repository;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.travels.entity.BusBean;
import com.travels.utility.DbConnection;

public class BusesDao {
	public static ResultSet getBusDetails() throws ClassNotFoundException, SQLException, IOException {
		Connection conn=DbConnection.connect();
		PreparedStatement ps= conn.prepareStatement("SELECT bus.busid, bus.bustype, bus.busnumber, bus.capacity, travels.travels FROM bus join travels where bus.travelid=travels.travelsid;");
		ResultSet result=ps.executeQuery();
		return result;
	}

	public static int deleteBus(BusBean bb) throws ClassNotFoundException, SQLException, IOException {
		Connection conn=DbConnection.connect();
		PreparedStatement ps= conn.prepareStatement("delete from bus where busid=?");
		ps.setInt(1, bb.getBusid());
		int status=ps.executeUpdate();
		return status;
	}

	public static int addBus(BusBean bb) throws ClassNotFoundException, SQLException, IOException {
		Connection conn=DbConnection.connect();
		PreparedStatement ps2= conn.prepareStatement("INSERT INTO `bus` (`bustype`, `busnumber`, `capacity`, `travelid`) VALUES (?, ?, ?, ?)");
		ps2.setString(1, bb.getBustype());
		ps2.setString(2,bb.getBusnumber());
		ps2.setInt(3,bb.getCapacity());
		ps2.setInt(4,bb.getTravelid());
		int status=ps2.executeUpdate();
		
		PreparedStatement ps= conn.prepareStatement("SELECT busid FROM bus where busnumber='"+bb.getBusnumber()+"'");
		ResultSet result=ps.executeQuery();
		int busid=0;
		System.out.println(ps);
		while(result.next()) {
			busid=result.getInt(1);
		}
		int st=0, i=0;
		for (i = 0; i < bb.getCapacity(); i++) {
			PreparedStatement ps3= conn.prepareStatement("INSERT INTO `seats`(`bus_id`, `seat_status`) VALUES ("+busid+",0)");
			st=ps3.executeUpdate();
		}
		return status;
	}
	
	public static int getBusesCount() throws ClassNotFoundException, SQLException, IOException {
		Connection conn=DbConnection.connect();
		int busCnt=0;
		PreparedStatement ps= conn.prepareStatement("SELECT count(busid) from bus");
		ResultSet result=ps.executeQuery();
		while(result.next()) {
			busCnt=result.getInt(1);
		}
		return busCnt;
	}

	public static int updateBus(BusBean bb) throws ClassNotFoundException, SQLException, IOException {
		Connection conn=DbConnection.connect();
		PreparedStatement ps= conn.prepareStatement("update bus set bustype='"+bb.getBustype()+"', busnumber='"+bb.getBusnumber()+"', capacity="+bb.getCapacity()+", travelid="+bb.getTravelid()+" where busid="+bb.getBusid());
		System.out.println(ps);
		int status= ps.executeUpdate();
		return status;
	}
}
