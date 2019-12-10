package com.travels.utility;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;

public class DbConnection {
	String driver;
	String url;
	String username;
	String password;
	public static Connection connect() throws SQLException, ClassNotFoundException, IOException {
		Properties dbProperties = new Properties();
		FileInputStream fis = new FileInputStream("C:\\Users\\NIKHIL\\Desktop\\TechM Project\\Travels\\jdbc.properties");
		dbProperties.load(fis);
		fis.close();

		DbConnection db=new DbConnection();
		db.driver = dbProperties.getProperty("sql.driver");
		db.url = dbProperties.getProperty("sql.url");
		db.username = dbProperties.getProperty("sql.username");
		db.password = dbProperties.getProperty("sql.password");

		// 1. Register the Driver class
		Class.forName(db.driver);

		// 2. Create connection
		Connection con=DriverManager.getConnection(db.url,db.username,db.password);
		return con;
	}
}
