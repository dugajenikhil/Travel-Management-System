package com.travels.repository;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.travels.utility.DbConnection;

public class TravelsDao {
	public static ResultSet getTravelNames() throws ClassNotFoundException, SQLException, IOException{
		Connection conn=DbConnection.connect();
		PreparedStatement ps=conn.prepareStatement("select travelsid, travels from travels");
		ResultSet result=ps.executeQuery();
		return result;
	}
}
