package com.travels.repository;
import java.io.IOException;
import java.sql.*;
import com.travels.utility.DbConnection;

public class SeatsDao {


	public static int updateSeatdetails(int[] arr) throws ClassNotFoundException, SQLException, IOException {
		Connection conn=DbConnection.connect();
		int status = 0, cnt=0;
		for (int i = 0; i < arr.length; i++) {
			if (arr[i]!=0) {
				PreparedStatement ps=conn.prepareStatement("UPDATE `seats` SET `seat_status`=1 WHERE seat_id="+arr[i]);
				status=ps.executeUpdate();
				cnt++;
			}
		}		
		return cnt;

	}
		
		
		
	}

